const connection = require("../connection");
const Sequelize = require("sequelize");

const Model = Sequelize.Model;

class Comment extends Model {}

Comment.init(
    {
        author: {
            type: Sequelize.STRING
            primaryKey: true,
            unique: true
        },
        bode: {
            type: Sequelize.STRING
                        primaryKey: true,
        },
        parent: {
            type: Sequelize.DATE,
            unique: true
        },
    },
    {
        sequelize: connection,
        modelName: "Comment",
    }
);

module.exports = Comment
