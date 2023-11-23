const { Marp } = require('@marp-team/marp-core')

const options = {
	imageFormat: 'svg'
}

module.exports = {
    engine: opts => new Marp(opts).use(require('markdown-it-plantuml'), options)
}
