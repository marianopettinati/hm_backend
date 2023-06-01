import express from "express";
import morgan from "morgan";

//routes
import productsRoutes from "./routes/products.routes.js";

const app = express();

//Settings
app.set("port", 4000);

//Middleware
app.use(morgan("dev"));

//Routes
app.use("/api/products", productsRoutes);

export default app;
