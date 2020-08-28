var conn = require('./connection');

function saveOrderItem(request) {
    return new Promise(function(resolve, reject){ 
        conn.query('INSERT INTO order_item SET  ?',[{productId:request.productId, userId:request.userId}], function(err, results){
            if(err) return reject(err);
            resolve(results.insertId);
        });
    });
}

function deleteItemFromBasket(productId, userId){
    conn.query("SELECT id FROM basket WHERE userId = ?",[userId], (err1, results1)=>{
        if(err1) throw er1r;
        basketId = results1[0].id;
        conn.query('DELETE FROM basket_product WHERE productId = ? and basketId = ?',[productId, basketId], function(err, results){
            if(err) return res.send(err);
            console.log('Uspješno obrisan produkat nova funkcija');
        })
    })
}

function updateSoldProduct(id){

    return new Promise(function(resolve, reject){ 
        conn.query("UPDATE PRODUCT SET soldInd = '1' WHERE id = ?",[id], function(err, results){
            if(err) return reject(err);
            resolve(id);
        })
    })
}
function updateBasketSoldProduct(id){

    return new Promise(function(resolve, reject){
        conn.query("UPDATE PRODUCT SET basketInd = '1' WHERE id = ?",[id], function(err, results){
            if(err) return reject(err);
            resolve(id);
        })
    })
}

module.exports = {

    getAll: function (req, res) {
        conn.query('SELECT * FROM PRODUCT', function (err, results) {
            if(err) return res.send(err);
            res.status(200).json(results);
        });
    },

    addProductToBasket: function(req, res){
        const body = req.body;
        userId = body.userId;
        updateBasketSoldProduct(body.productId);

        //Get korpu od user 
        conn.query("SELECT id FROM basket WHERE userId = ?",[userId], (err1, results1)=>{
            if(err1) throw err1;
    
            basketId = results1[0].id;      
            productId = body.productId;     
           
            //Upisi u basket_product novi produkt sto se doado
            conn.query("INSERT INTO `basket_product` SET ?" ,{id:null, productId, basketId} ,(err, results)=>{
                if (err) 
                    return res.status(500).send(err);
                res.status(200).json(results.insertId);
            })
        })
    },
    addProduct: function(req, res){
        const product = req.body;
        console.log(product);
        conn.query('INSERT INTO `product` SET ?', product, (err, result) => {
            if (err) {
                console.log(err);
                return res.status(500).send(err);
            }
            console.log(result);    
            res.status(200).json(result[0]);
        });
    },
    deleteFromBasket: function (req, res){
        const body = req.body;
        const id = req.query.id;
        console.log("id ===" +id);
        const userId = req.query.userId;
        //updateBasketSoldProducts(body.productId);
        conn.query("SELECT id FROM basket WHERE userId = ?",[userId], (err1, results1)=>{
            if(err1) throw er1r;
            basketId = results1[0].id;

            conn.query('UPDATE `product` SET  basketInd = ? WHERE id = ?', [0, id], (err, result)=>{
                if (err){
                    console.log(err);
                    return res.status(500).send(err);   
                } 
            })

            conn.query('DELETE FROM basket_product WHERE productId = ? and basketId = ?',[id, basketId], function(err, results){
                if(err) return res.send(err);
                res.status(200).json({message:'Uspješno obrisan produkat'});
            })
        })
    },
    getBaskerForUsert: function(req, res){
        const id = req.query.userId;
        
        console.log("id ===" +id);
        //Get korpu od user 
        conn.query("SELECT id FROM basket WHERE userId = ?",[id], (err1, results1)=>{
            if(err1) throw err1;
            basketId = results1[0].id;      
            console.log("id ===" +basketId);
            conn.query("SELECT productId FROM `basket_product` WHERE basketId = ?",[basketId], (err2, results2)=>{
                if(err2) throw err2;
                

                console.log(results2);
                var niz = [];
                results2.forEach(item => {
                    niz.push(item.productId);
                    
                })
                if (niz.length == 0) {
                    return res.status(200).json([]);
                }
                conn.query("SELECT * FROM `product` WHERE id IN (?)",[niz], (err3, results3)=>{
                    if(err3) throw err3;    
                    res.status(200).json(results3); 
                })
                
            })

        })
    },
    saveOrdersForUser: async function(req, res){
        const request = req.body;
        try{
            const orderId = await saveOrderItem(request);
            deleteItemFromBasket(request.productId, request.userId);
            await updateSoldProduct(request.productId);
            console.log('uspjesno');
            res.status(200).json({id:orderId})
        }catch(err){
            res.status(500).send(err);
            }
    },
    getProductById: function(req, res){
        const id = req.query.productId;
        console.log("id ===" +id);
        conn.query("SELECT * FROM product WHERE id = ?",[id], (err, result)=>{
            if (err) 
            return res.status(500).send(err);   
            res.status(200).json(result);
        })
    },
    
    deleteProductById: function(req, res){
        const id = req.query.productId;
        console.log("id == " + id);
        conn.query("DELETE FROM order_item WHERE productId = ?",[id], (err1, result1)=>{
            conn.query("DELETE FROM product WHERE id = ?",[id], (err, result)=>{
                if (err) {
                    console.log(err);
                    return res.status(500).send(err); 
                }   
                res.status(200).json(result);
            })
        })
    },
    
    search: function(req, res){
        let name = req.query.name;
        let  max = req.query.max;
        let min = req.query.min;

        if(!name) name= "";

        if((name=="" || name) && (max || min)){

            console.log("name= " +name +"minmax" + min + max)

            conn.query("SELECT * FROM product WHERE name LIKE ? AND price BETWEEN ? AND  ?",["%"+name+"%", min, max], (err, result)=>{
                if (err) 
                    return res.status(500).send(err);   
                return res.status(200).json(result);
            })
        }    
        else {
            let arr  = [];
            res.status(200).json(arr);
        }
    },
    updateProduct:function(req, res){
        let product = req.body;
        console.log(product);
        const id = req.query.productId
        console.log("id ===" +id);
        conn.query('UPDATE `product` SET name = ?, price = ?, description = ?, image = ?,  shortdesc = ?, createDate = ?, soldInd = ?, basketInd = ? WHERE id = ?', [product.name, product.price, product.description, product.image, product.shortdesc, product.createDate, product.soldInd, product.basketInd, id], (err, result)=>{
            if (err){
                console.log(err);
                res.status(500).send(err);   
            } 
            res.status(200).json(result);
        })
    },
    getOrderForUser: function(req, res){
        const id = req.query.userId;
        conn.query('SELECT * FROM order_item WHERE userId = ?', [id],function (err, results) {
            if(err) return res.send(err);
            
            console.log(results);
            var niz = [];
            results.forEach(item => {
                niz.push(item.productId);
            })
            
            if (niz.length == 0) {
                 return res.status(200).json([]);
            }
            
            conn.query("SELECT * FROM `product` WHERE id IN (?)",[niz], (err3, results3)=>{
                if(err3) throw err3;    
                    res.status(200).json(results3); 
            })
        });
    }

}
