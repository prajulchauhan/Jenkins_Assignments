def call(Map vars, Closure body=null) {
    vars = vars ?: [:]
    def groupname = vars.get("gname",null)
    echo groupname
    if (groupname!='NA'){
  sh "echo  ${groupname} | xargs -n 1 sudo groupadd -r "
    }
    else {
      echo "Quitting !No name provided."
    }

}