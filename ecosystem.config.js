module.exports = {
  apps: [
    {
      name: "aws-demo",
      script: "dist/index.js", // Pointing to the bundled production file
      cwd: "/srv/aws-demo",
      exec_mode: "fork",
      instances: 1,
      max_memory_restart: "300M",
      env: { 
        NODE_ENV: "production", 
        PORT: 3000 
      },
      watch: false,
      autorestart: true,
      merge_logs: true,
      // Note: Make sure the 'logs' folder exists in your cwd if using these:
      log_file: "./logs/combined.log",
      error_file: "./logs/error.log",
    },
  ],
};
