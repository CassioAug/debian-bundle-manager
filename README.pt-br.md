# Debian Bundle Manager

Um script Bash simples, mas poderoso, para automatizar a instalação de pacotes de software em sistemas baseados em Debian.

Este script lê uma lista de aplicativos de um arquivo de texto e os instala usando o gerenciador de pacotes APT ou o Flatpak. Ele foi projetado para tornar a configuração de uma nova máquina ou a sincronização de software entre vários computadores uma tarefa rápida e fácil.

## ✨ Recursos

- **Suporte a Duplos Gerenciadores de Pacotes:** Instala software tanto dos repositórios padrão do APT quanto do Flatpak.

- **Instalação Inteligente:** Verifica se um pacote já está instalado antes de tentar a instalação, economizando tempo e evitando erros.

- **Formato de Pacote Simples**: Usa um arquivo de texto simples para listar o software que você deseja, o que é fácil de criar e editar.

- **Suporte a Comentários**: Você pode adicionar comentários (linhas que começam com #) em seu arquivo de pacote para mantê-lo organizado.

- **Suporte a Múltiplos Idiomas**: Exibe automaticamente as mensagens em inglês ou português do Brasil com base no idioma do seu sistema.

## ⚙️ Requisitos

- Uma distribuição Linux baseada em Debian (ex: Ubuntu, Debian, Linux Mint).

- Bash (que é padrão em quase todos os sistemas Linux).

- Flatpak deve estar instalado se você pretende instalar aplicativos dessa fonte.

## 🚀 Como Usar

### 1. Torne o script executável

Antes de poder executar o script, você precisa dar a ele permissão de execução. Abra um terminal no diretório do script e execute:

```shell
chmod \+x bundle-manager.sh
```

### 2. Crie seu arquivo de pacote

Crie um arquivo .txt e liste os pacotes que deseja instalar. Veja o guia de formato abaixo.

### 3. Execute o script

Execute o script a partir do seu terminal, fornecendo o caminho para o seu arquivo de pacote como argumento. O script precisa de privilégios de administrador para funcionar.

```shell
sudo ./bundle-manager.sh meus-apps.txt
```

## 📝 Formato do Arquivo de Pacote

O arquivo de pacote é um arquivo de texto simples onde cada linha contém um pacote a ser instalado.

Para pacotes APT, basta escrever o nome do pacote.

```
vim
neovim
gimp
```

Para pacotes Flatpak, prefixe o ID do aplicativo com 'flatpak:'.

```
flatpak:com.bitwarden.desktop
flatpak:org.jdownloader.JDownloader
```

Para comentários, inicie a linha com um:

```
# Isto é um comentário e será ignorado
```

### Exemplo (bundle-example.txt):

```
# Aplicativos APT:
neovim
ripgrep
fzf

# Aplicativos Flatpak:
flatpak:com.borgbase.Vorta
flatpak:io.github.peazip.PeaZip
```
