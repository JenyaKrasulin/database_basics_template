const connection = require('../connection');
const Sequilize = require('sequelize');

const User = require('./user.js');
const Project = require('./project.js');

class Access extends Sequilize.Model {}

Access.init(
    {
        id: {
            type: Sequilize.INTEGER,
            primaryKey: true
        },
        Role_name: {
            type: Sequilize.STRING(100),
            allowNull: false
        },
        User_id: {
            type: Sequilize.INTEGER,
            allowNull: true
        },
        User_login: {
            type: Sequilize.INTEGER,
            allowNull: true
        }
        Dataset_GUID: {
            type: Sequilize.INTEGER,
            allowNull: true
        }
    },
    {
        sequelize: connection,
        freezeTableName: true,
        modelName: 'Access'
    }
);

User.hasMany(Access);
Project.hasMany(Access);

Access.belongsTo(User, {
    foreignKey: 'user_id'
});

Access.belongsTo(Datafile, {
    foreignKey: 'datafile_id'
});

module.exports = Access
