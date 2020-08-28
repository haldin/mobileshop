var express = require('express');
var UserDAO = require('./UserDao');
var ProductDAo = require('./ProductDAO');
var app = express();
var bodyParser = require ('body-parser');
var cors = require('cors');
var PORT = 3000;


app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());
app.use(cors());

  


app.get("/product/all", ProductDAo.getAll );
app.get("/users/all", UserDAO.getAll );
app.get("/basket/product", ProductDAo.getBaskerForUsert);

app.get("/product/get", ProductDAo.getProductById);
app.get("/product/get", ProductDAo.getProductById);
app.get("/order/all" , ProductDAo.getOrderForUser)


app.post("/product/add-to-basket", ProductDAo.addProductToBasket);

app.post("/registrarion", UserDAO.register);
app.post("/login", UserDAO.login);
app.post("/order/insert", ProductDAo.saveOrdersForUser);
app.post("/product/insert", ProductDAo.addProduct);
app.get("/product/search", ProductDAo.search)

app.delete("/basket/delete", ProductDAo.deleteFromBasket);
app.delete("/product/delete", ProductDAo.deleteProductById);

app.put("/product/edit", ProductDAo.updateProduct)

app.listen(PORT, function() {
    console.log('Application is started '+ PORT);
    
});
