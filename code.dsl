workspace "Diagrama de arquitetura PetClinic com Structurizr DSL" {
//Feito por: Sasha Caroline 25-10-2023
    model {
       user = person "Usuários do sistema" "Clientes cadastrados na Clínica Pet." 
       adm = person "Administrador do sistema" "administra o sistema fazendo testes e corrigindo problemas"
       softwareSystem = softwareSystem "Sistema PetCLinica" {
            componentes = container "componentes de gerenciamento do sistema" {
                webapp = component "Web app" "Fornece todos os serviços e funcionalidade pela internet aos clientes por meio do navegador web" 
                c1petController = component "Controller Pet"
                c2vetController = component "Controller Veterinário"
                c3consultaController = component "Controller Consulta"
                c4servicePet = component "Service Pet" "Responsável pelo acesso aos dados, validando as informações recebidas na camada Controllers"
                api = component "Api Aplicação"
            }
            db = container "Banco de Dados" "Armazena o registro do usuário como informações pessoais, autenticação, credenciais, registro de acesso, etc" {
               tags "Database"
            }
        }
      
        user -> webapp "Todos os usuários podem visualizar as informações do sistema e ter acesso as suas funcionalidadews"
        
        webapp -> c1petController "utiliza"
        webapp -> c2vetController "utiliza"
        webapp -> c3consultaController "utiliza"
        
        c1petController -> c4servicePet "faz as requisições do sistema, enviando apenas as informações relevantes para completar a requisição."    
        c2vetController -> c4servicePet "faz as requisições do sistema, enviando apenas as informações relevantes para completar a requisição."    
        c3consultaController -> c4servicePet "faz as requisições do sistema, enviando apenas as informações relevantes para completar a requisição."    
        c4servicePet -> api "consome a aplicação consultando e enviando dados/informações"
       
        api -> db "ler e armazenar os dados/informações"
        adm -> api "atualiza e corrige problemas relacionados ao sistema e usuário"
        
    }

    views {
        properties {
           c4plantuml.tags true
        }
        systemContext softwareSystem "Diagrama1" {
            include *
            autoLayout lr
        }
        container softwareSystem "Diagrama2" {
            include *
            autoLayout lr
        }
        component componentes "Diagrama3"{
            include * 
            autoLayout lr
        }
      
        styles {
            element "person" {
                shape person
            }
             element "Component" {
                background #0bbed8
            }
            element "Container" {
                background #2d4a64
            }
            element "Database" {
                shape cylinder
            }
        }
        
        theme default
    }
}