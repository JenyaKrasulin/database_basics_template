const models = require('./models');

const userMapper = (user) => {
    console.log(user.id + ' | ' + user.login + ' | ' + user.email + ' | ' + user.password);
};

const DatafileMapper = (Datafile) => {
    console.log('#' + Datafile.id + ' | ' + Datafile.login);
};


(async () => {
    console.log('Projects info List');
    const Plist = (await models.Project.findAll());
    Plist.map(DatafileMapper);
    console.log('Users info list');
    const usersL = await models.User.findAll();
    usersL.map(userMapper);
    console.log('Datafile to  User');
    const Datafile = await models.Datafile.findAll({
        include: [{
            model: models.User,
            through: {
                attributes: ['role_name']
            }
        }]
    });
    Datafile.map(project => {
        console.log('#' + Datafile.id + ' | ' + Datafile.name);
        Datafile.users.map(user => {
            console.log(user.id + ' | ' + user.login + ' | ' + user.project_user.dataValues.role_name);
        });
    })
})();
