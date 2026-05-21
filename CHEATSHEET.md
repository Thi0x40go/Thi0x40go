# 🚀 Manual de Elite - Neovim

### 🤖 Inteligência Artificial (Gemini CLI)
*O Gemini "vê" o arquivo que você está editando e onde está o seu cursor.*
- `<leader>ag` : **Janela Flutuante** (Dúvidas rápidas sem mudar o layout)
- `<leader>ah` : **Modo Horizontal** (Bom para ler logs enquanto conversa)
- `<leader>av` : **Modo Vertical** (Ideal para manter o chat aberto enquanto coda ao lado)
- `<leader>Ai` : **Liga/Desliga** o auto-completar da IA (Ollama/Qwen)
- `Alt + y`    : **Aceitar** sugestão da IA (Texto cinza)
- `Alt + n/p`  : Ver **Próxima / Anterior** sugestão
- `Alt + e`    : **Ignorar** sugestão
- *Dica:* No chat, pergunte: "Como este método funciona?" ou "Refatore a seleção".

### ☕ Java & Kotlin (IntelliJ Style)
- `<leader>jn` : **Novo Arquivo** (Gera o `package` automático baseado na pasta)
- `<leader>jc` : Criar **Classe** | `<leader>ji` : **Interface** | `<leader>je` : **Enum**
- *Dica Java:* O `<leader>cx` detecta se o projeto é Maven ou Gradle automaticamente.

### 🎯 C# & .NET
- `<leader>cR` : **Rodar Projeto** (Detecta o seu `.csproj` e executa)
- `<leader>sc` : **REPL Interativo** (Uma "calculadora" de C# para testar lógica rápida)
- `<leader>sl" : Envia a linha atual para o REPL
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

### 🌐 Frontend, Java & API
- `<leader>cx` : **Menu de Execução** (Roda arquivo Java/JS solto ou Dev Servers)
- `<leader>rj` : **Spring Quick Request** (Gera um teste HTTP de um @GetMapping)
- `<leader>Rr` : **Executar Requisição** HTTP (Kulala - em arquivos .http)
- `<leader>Re` : **Mudar Ambiente** (Trocar entre Local, Dev, Prod)

### 🗄️ Banco de Dados & Docker
- `<leader>D`  : **Gaveta de Dados** (Conecte em Postgres, MySQL, SQL Server)
- `<leader>ad` : **Lazydocker** (Gerencie containers, logs e volumes visualmente)

### 🌲 Git & Outros
- `<leader>gd` : Abrir Visão de **Diff**
- `<leader>gD` : Fechar Visão de Diff
- `<leader>ua` : **Ligar/Desligar Auto-Save** (Salva arquivos automaticamente ao digitar)
- `<leader>qs` : **Restaurar Sessão** (Abre as últimas abas e arquivos que você fechou)
- `<leader>fp` : **Mudar de Projeto** (Abre a lista de projetos detectados)
- `<leader>?`  : **Este Guia**

### 📓 Obsidian (Anotações)
- `<leader>os` : **Procurar Notas**
- `<leader>od` : **Nota Diária** (Hoje)
- `<leader>ot` : **Nota de Amanhã**
- `<leader>oy` : **Nota de Ontem**
- `<leader>of` : **Pular para outra nota** (Quick Switch)
- `<leader>oc` : **Inserir Template**
- `<leader>oP` : **Colar Imagem** (Pede o nome e salva no Vault)
