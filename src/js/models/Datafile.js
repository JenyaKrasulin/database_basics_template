const connection = require('../connection');
const Sequilize = require('sequelize');

class Datafile extends Sequilize.Model {}

Datafile.init(
    {
        id: {
            type: Sequilize.INTEGER,
            primaryKey: true
        },
        MIME: {
            type: Sequilize.STRING(500),
            allowNull: false
        },
        name: {
            type: Sequilize.STRING(1000),
            allowNull: true
        }
        userlogin: {
            type: Sequilize.STRING(1000),
            allowNull: true
        }
        dataset: {
            type: Sequilize.INTEGER,
            allowNull: true
        }
    },
    {
        sequelize: connection,
        freezeTableName: true,
        modelName: 'Datafile'
    }
);

module.exports = Datafile
