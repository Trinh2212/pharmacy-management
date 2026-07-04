require("dotenv").config();
const jwt = require("jsonwebtoken");

const verifyToken = (req, res, next) => {
    const authHeader = req.headers.authorization;
    if (authHeader) {
        const token = authHeader.split(" ")[1];
        // console.log(req.headers.authorization);
        jwt.verify(token, process.env.JWT_ACCESS_KEY, (err, employee) => {
            if(err) 
                return res.status(401).json("Token không hợp lệ hoặc đã hết hạn ")
            req.employee = employee;
            next()
        });
    } else {
        return res.status(401).json("bạn chưa được xác thực đâu")
    }
}

const verifyAdmin = (req, res, next) => {
    verifyToken(req, res, () => {
        if (req.employee.role === 'admin') {
            next();
        } else {
            return res.status(403).json('yêu cầu quyền admin để thực hiện hành động này')
        }
    })
}

module.exports = {
    verifyToken,
    verifyAdmin
}