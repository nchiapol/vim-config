all

rule 'MD003', :style => :setext_with_atx
rule 'MD004', :style => :sublist
rule 'MD007', :indent => 2
rule 'MD029', :style => :ordered
rule 'MD024', :allow_different_nesting => true
exclude_rule 'MD012'
exclude_rule 'MD022'
exclude_rule 'MD031'
exclude_rule 'MD032'
exclude_rule 'MD034'
exclude_rule 'MD041'

# see https://github.com/markdownlint/markdownlint/blob/main/docs/RULES.md
