# 🚀 Manual de Elite - Neovim

### 🤖 Inteligência Artificial (Gemini CLI)
*O Gemini "vê" o arquivo que você está editando e onde está o seu cursor.*
- `<leader>ag` : **Janela Flutuante** (Dúvidas rápidas sem mudar o layout)
- `<leader>ah` : **Modo Horizontal** (Bom para ler logs enquanto conversa)
- `<leader>av` : **Modo Vertical** (Ideal para manter o chat aberto enquanto coda ao lado)
- *Dica:* No chat, pergunte: "Como este método funciona?" ou "Refatore a seleção".

### ☕ Java & Kotlin (IntelliJ Style)
- `<leader>jn` : **Novo Arquivo** (Gera o `package` automático baseado na pasta)
- `<leader>jc` : Criar **Classe** | `<leader>ji` : **Interface** | `<leader>je` : **Enum**
- *Dica:* Use o Neo-tree (`<leader>e`) para navegar nas pastas compactadas.

### 🎯 C# & .NET
- `<leader>cR` : **Rodar Projeto** (Detecta o seu `.csproj` e executa)
- `<leader>sc` : **REPL Interativo** (Uma "calculadora" de C# para testar lógica rápida)
- `<leader>sl` : Envia a linha atual para o REPL
- `<leader>sv` : Envia o bloco selecionado (Modo Visual) para o REPL

### 🧪 Testes (Neotest)
- `<leader>ts` : **Árvore de Testes** (Veja o status verde/vermelho do projeto)
- `<leader>to` : **Ver Erro** (Abre o log detalhado se o teste falhar)
- *Dica:* O contador acima da função diz quantos lugares usam aquele código.

### 🛠️ LSP & Refatoração (Ações Profissionais)
- `K`          : **Hover** (Mostra a documentação e tipos sem poluir a tela)
- `gp`         : **Espiar** (Vê o código de outra classe em um popup)
- `gr`         : **Find Usages** (Quem me chama? Abre o radar de referências)
- `<leader>cs` : **Structure** (Aba lateral com a estrutura do arquivo)
- `<leader>rn` : **Rename** (Mude o nome e veja o código mudar "ao vivo")
- `<leader>re` : **Extrair Função** (Selecione um bloco e transforme em um novo método)
- `<leader>ca` : **Ações (Lâmpada)** (Correções rápidas como "Importar Classe")

### 🌐 APIs & Rest (Kulala)
- `<leader>Rr` : **Rodar Requisição** (Funciona em arquivos `.http`)
- `<leader>Re` : **Mudar Ambiente** (Trocar entre Local, Dev, Prod)
- *Dica:* Crie um arquivo `teste.http` e escreva `GET https://google.com` para testar.

### 🗄️ Banco de Dados & Docker
- `<leader>D`  : **Gaveta de Dados** (Conecte em Postgres, MySQL, SQL Server)
- `<leader>ad` : **Lazydocker** (Gerencie containers, logs e volumes visualmente)

### 🌲 Outros Atalhos
- `<leader>ua` : **Auto-Save** (Ativa/Desativa o salvamento automático)
- `<leader>qs` : **Restaurar Sessão** (Volta para onde você parou antes de fechar)
- `<leader>?`  : **Este Guia**
