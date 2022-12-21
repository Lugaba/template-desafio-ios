# Interface
Para implementar as três telas procurei trazer um pouco da temática do desenho "Rick e Morty", utilizei a paleta de cores e a fonte do próprio conteúdo. Começando pela HomeView, decidi utilizar uma CollectionView como elemento de listagem dos personagens por preferência pessoal. A tela de filtro fiz igual ao protótipo de baixa e a tela de detalhes do personagem apresenta apenas uma UIImageView e UILabels.

# Coletar dados da API
Como o projeto é coordenado por uma API, decidi criar uma classe no modelo Singleton chamada DataManager. Esta é responsável por gerenciar as requisiões da API e o carregamos das imagens em Cache em uma thread diferente da main. Dessa forma, o usuário poderá mexer no aplicativo sem que a tela fique congelada.

# Testes unitários
Na parte de testes unitários utilizei o modelo "Given/When/Then", no qual definimos os dados iniciais (Given), alteramos esses dados de acordo com as necessidades do teste (When) e, por último, comparamos os resultados encontrados com os resultados esperados (Then). Durante os testes, também dei atenção aos protocolos criados, para testar criei Mocks desses protocolos e busquei testar se a função do protocolo é chamada (utilizei Bool para coletar essa informação).
