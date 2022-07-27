const jwt = require("jsonwebtoken");
const config = require("../config/user.config");


let checkToken = (req, res, next) => {
  let token = req.body.token || req.query.token || req.headers["x-access-token"];
  console.log(token);
//   token = token.slice(7, token.length);
  if (token) {
    jwt.verify(token, config.key, (err, decoded) => {
      if (err) {
        return res.json({
          status: false,
          msg: "token is invalid",
        });
      } else {
        req.decoded = decoded;
        next();
      }
    });
  } else {
    return res.json({
      status: false,
      msg: "Token is not provided",
    });
  }
};

module.exports = {
  checkToken: checkToken,
};