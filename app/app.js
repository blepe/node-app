const app = require('http').createServer((req, res) => res.end('Hello!'));
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(\`Server is listening on port \${PORT}\`);
});
