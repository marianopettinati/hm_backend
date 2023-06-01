import { getConnection } from "./../database/database";

const getProducts = async (req, res) => {
  const connection = await getConnection();
  const result = await connection.query(
    "SELECT idProductos, nombre, descripcion FROM Productos"
  );
  console.log(result);
  res.json(result);

  // res.json("Yo soy el json de todos los productos");
};

export const methods = {
  getProducts,
};
