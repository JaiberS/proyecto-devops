const express = require("express");
const app = express();

const PORT = process.env.PORT || 3000;

// Función que consume CPU calculando números primos
function calcularPrimos(n) {
  const primos = [];
  let num = 2;

  while (primos.length < n) {
    if (primos.every(p => num % p !== 0)) {
      primos.push(num);
    }
    num++;
  }
  return primos;
}

app.get("/", (req, res) => {
  res.send("¡Hola, mundo! La API está funcionando correctamentes.");
});

// Ruta para consumir CPU
app.get("/cpu-intensive", (req, res) => {
  const cantidad = parseInt(req.query.n) || 5000; // Puedes ajustar este número para mayor carga
  console.log(`Procesando cálculo intensivo con ${cantidad} números primos...`);
  const primos = calcularPrimos(cantidad);
  res.json({ message: `Cálculo completado para ${cantidad} números primos.` });
});

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
