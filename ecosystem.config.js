module.exports = {
  apps : [{
    name: "app",
    script: "./server/start-prod.js",
    exec_interpreter: "./node_modules/.bin/babel-node",
    error_file: 'err.log',
    out_file: 'out.log',
    log_file: 'combined.log',
    env: {
      NODE_ENV: "development",
    },
    env_production: {
      NODE_ENV: "production",
    }
  }]
}