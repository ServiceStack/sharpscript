{{#each range(100,50) }}
The number {{it}} is {{ it.isEven() ? 'even' : 'odd' }}.
{{/each}}
