var conn = require('./connection');
 
function createBasket(userId){

    console.log("2");

    conn.query('INSERT INTO `basket` SET ?',{id:null,userId}, (err, result) => {
        if (err) 
            return res.status(500).send(err);
        console.log(result);    
    
    });
}

module.exports = {
    register: function(req, res){
        const user = req.body;
        console.log(user);
        conn.query('INSERT INTO `user` SET ?', user, (err, result) => {
            if (err) {
                console.log("jebe");    
                return res.status(500).send(err);
            }
            console.log("1");
            console.log(result);    
            createBasket(result.insertId)
            console.log("n");
            res.status(200).json(result.insertId);
        });
    },
    login: function(req, res){
        const user = req.body;
        conn.query('SELECT * FROM USER WHERE userName = ? and password = ?', [user.userName, user.password],(err, result) => {
            if (err)return res.status(500).send(err);
            console.log(result);    
            res.status(200).json(result[0]);
        });
    },
    getAll: function(req, res){
        conn.query('SELECT * FROM USER', function (err, results) {
            if(err) return res.send(err);
            res.status(200).json(results);
        });
    }
    

}