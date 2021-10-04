from app import microblog
from flask import render_template

@microblog.route('/')
@microblog.route('/index')
def index():

    user = {'username':'tolik'}
    allposts = [
        {
            'author':{'tolik':['123','321']}
        },
        {
            'author':{'vasia':['qwe','ewq']}
        }
    ]

    for tmppost in allposts:
        if "".join(list(tmppost['author'].keys())) == user['username']:
            posts = list(tmppost['author'][user['username']])


    return render_template('index.html',
                           title='Home',
                           user=user['username'],
                           posts=posts)
