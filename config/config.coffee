path = require 'path'
rootPath = path.normalize(__dirname + '/..')

module.exports = 
  development:
    db: 'mongodb://localhost/osl_admin_dev'
    root: rootPath
    app: 
      name: 'OSL admin'
  test: {}
  production:{}