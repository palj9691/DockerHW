pipeline {
agent {label 'linux'}
	git url: 'https://github.com/palj9691/DockerHW.git', branch: 'master'
	stage ("Linting") {
		steps {
			sh 'flake8 app/*.py'
		}
	}
	stage ("Build") {
		steps {
			sh "docker build -t classweb:${BUILD_NUMBER}"
		}
	}
	stage ("Test") {
		steps {
			sh "docker run -d --name classweb1 -p 80:8080 classweb:${BUILD_NUMBER}"
			sh "EXPOSE: 8080"
			sh 'curl $(curl 18.234.59.33/latest/meta-data/local-ipv4) | grep "super"'
		}
	}
	post {
		always {
			sh "[\"\$(docker ps -q -f name=classweb1)\"] && docker kill classweb1 && docker rm classweb1"
		}
	}	
}
