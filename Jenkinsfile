pipeline{
    agent any
    stages{
        stage("Code Checkout"){
            steps{
                echo "Code checkout"
                git url:"https://github.com/TarunKumar50/django-notes-app.git", branch: "dev"
            }
        }
  
    stage("deploy"){
        steps{
            sh "docker-compose up -d"
        }
    }
    }
}
