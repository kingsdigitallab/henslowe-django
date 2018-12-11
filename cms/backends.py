from wagtail.search.backends.elasticsearch2 import ElasticsearchAutocompleteQueryCompilerImpl  # noqa
from wagtail.search.backends.elasticsearch5 import (
    Elasticsearch5Index, Elasticsearch5Mapping, Elasticsearch5SearchBackend,
    Elasticsearch5SearchQueryCompiler, Elasticsearch5SearchResults)


class HighlighterMapping(Elasticsearch5Mapping):
    all_field_name = '_all_text'
    edgengrams_field_name = '_edgengrams'

    def get_document_id(self, obj):
        return str(obj.pk)

    def get_document_type(self):
        return 'doc'

    def get_mapping(self):
        mapping = super().get_mapping()

        # Add _all_text field
        mapping[self.get_document_type()]['properties'][self.all_field_name] = {  # noqa
            'type': 'text'}

        # Replace {"include_in_all": true} with {"copy_to": "_all_text"}
        def replace_include_in_all(mapping):
            for name, field_mapping in mapping['properties'].items():
                if 'include_in_all' in field_mapping:
                    if field_mapping['include_in_all']:
                        field_mapping['copy_to'] = self.all_field_name

                    del field_mapping['include_in_all']

                if field_mapping['type'] == 'nested':
                    replace_include_in_all(field_mapping)

        replace_include_in_all(mapping[self.get_document_type()])

        return mapping


class HighlighterIndex(Elasticsearch5Index):
    pass


class HighlighterSearchQueryCompiler(Elasticsearch5SearchQueryCompiler):
    mapping_class = HighlighterMapping

    def get_query(self):
        inner_query = self.get_inner_query()

        return {
            "multi_match": {
                "fields": ["cms_image__subtitle", "cms_image__transcription",
                           "title", "cms_richtextpage__body"],
                "query": inner_query['multi_match']['query']
            }
        }


class HighlighterSearchResults(Elasticsearch5SearchResults):
    def _get_es_body(self, for_count=False):
        body = super(HighlighterSearchResults, self)._get_es_body(for_count)

        if not for_count:
            body['highlight'] = {
                "type": "plain",
                "number_of_fragments": 3,
                "fragment_size": 500,
                "fields": {
                    "cms_image__subtitle": {},
                    "title": {},
                    "cms_richtextpage__body": {},
                    "cms_image__transcription": {},
                }
            }
        return body

    def _do_search(self):

        # Params for elasticsearch query
        params = dict(
            index=self.backend.get_index_for_model(
                self.query_compiler.queryset.model).name,
            body=self._get_es_body(),
            _source=False,
            from_=self.start,
        )

        params[self.fields_param_name] = 'pk'

        # Add size if set
        if self.stop is not None:
            params['size'] = self.stop - self.start

        # Send to Elasticsearch
        hits = self.backend.es.search(**params)

        # Get pks from results
        pks = [hit['fields']['pk'][0] for hit in hits['hits']['hits']]
        scores = {str(hit['fields']['pk'][0]):
                  hit['_score'] for hit in hits['hits']['hits']}
        highlights = {str(hit['fields']['pk'][0]):
                      hit['highlight'] for hit in hits['hits']['hits']}

        # Initialise results dictionary
        results = dict((str(pk), None) for pk in pks)

        # Find objects in database and add them to dict
        queryset = self.query_compiler.queryset.filter(pk__in=pks)

        self.res_count = len(queryset)

        for obj in queryset:
            results[str(obj.pk)] = obj

            if self._score_field:
                setattr(obj, self._score_field, scores.get(str(obj.pk)))

        # Return results in order given by Elasticsearch

        return [(
                results[str(pk)],
                highlights.get(str(pk))[list(
                    highlights.get(str(pk)).keys())[0]][0]
                ) for pk in pks if results[str(pk)]]


class HighlighterAutocompleteQueryCompiler(HighlighterSearchQueryCompiler, ElasticsearchAutocompleteQueryCompilerImpl):  # noqa
    pass


class HighlighterSearchBackend(Elasticsearch5SearchBackend):
    mapping_class = HighlighterMapping
    index_class = HighlighterIndex
    query_compiler_class = HighlighterSearchQueryCompiler
    autocomplete_query_compiler_class = HighlighterAutocompleteQueryCompiler
    results_class = HighlighterSearchResults


SearchBackend = HighlighterSearchBackend
