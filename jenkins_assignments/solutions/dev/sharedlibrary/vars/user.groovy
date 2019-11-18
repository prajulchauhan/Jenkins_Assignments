def call(Map vars, Closure body=null) {
    vars = vars ?: [:]
    def usernames = vars.get("uname",null)
    echo usernames
    if (usernames!='NA'){
  sh "echo  ${usernames} | xargs -n 1 sudo useradd -r "
    }
    else {
      echo "Quitting !No name provided."
    }

}
def delete(Map vars, Closure body=null) {
    vars = vars ?: [:]
    def usernames = vars.get("udel",null)
    echo usernames
    if (usernames!='NA'){
  sh "echo  ${usernames} | xargs -n 1 sudo userdel -r "
    }
    else {
      echo "Quitting !No name provided."
    }

}