const validate = (requestType) => {
    return (req, res, next) => {
        const {error} = requestType.validate(req.body);
        if (error) {
            return res.status(400).json({
                message: "lỗi phía client, dữ liệu chưa hợp lệ",
                error: error.details[0].message
            });
        }
        next();
    };
}

module.exports = validate;