jq '[to_entries[] | {name: .key, description: .value.description, attributes: .value.attributes|[{name:.[]}]  }  ]' vetur/tags.json > web-types_convert.json

webtypes=$(cat web-types_convert.json)

jq ".contributions.html.tags |= . + ${webtypes}" 'web-types.json' > web-types.json.temp

rm web-types_convert.json

mv web-types.json.temp web-types.json
