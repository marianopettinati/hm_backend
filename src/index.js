import app from "./app";

const main = () => {
  app.listen(app.get("port"));
  console.log("Servidor corriendo en puerto 4000");
};

main();
