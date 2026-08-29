# Nvim Setup: WSL2
- For WSL PC
- This is just a list of stuff that I have currently on this setup (to keep track)


## Treesitter: Nvim-Treesitter
- **ALl Language Parsers Have Been Installed**

## LSPs: Nvim-Lspconfig + Mason.nvim + Mason-Lspconfig.nvim
1. *Python*
    - ty + ruff
        - Never switch to basedPyRight (too slow / atomic lsp)
    - uv (I don't use uv like ever)

2. *Java*
    - nvim-jdtls
        - Custom config with jdtls_setup.lua
            - **Make sure to update the realpath of the eclispse launcher upon new update**
        - Atomic LSPs, but it's not too bad
        - Uses Eclispse JDTLS lsp

3. *C#*
    - rosyln
        - Had to do some finicky solution to use with godot
        - Simple, fast and industry standard
        - Make sure to update with dotnet packages and Microsoft Code Completion
            - **More dotnet cli issues than roslyn**

4. *Lua*
    - lua_ls + stylua
        - Simple, works out of the box
        - But I only use Lua for my nvim setup

5. *C*
    - clangd + clang-format
        - works well, perfectly fine. c is a beautiful language that is humble
        - gcc for compiler tho

6. *C++*
    - clangd + clang-format
        - works well, perfectly fine. c is a beautiful language that is humble
        - gcc for compiler tho 

7. *GDScript*
    - gdtoolkit
    - Hard on WSL2 (cus of networking mode / setting up nvim to listen on Godot's lsp server)
    - Easy on linux
        - Had to write a custom nvim alias for both
    - Needs nvim to listen to a specifc port when Godot Engine is open to receive real time object information to the lsp

8. *Markdown*
    - Marksman
        - Works out of the box. .marksman.toml is great

9. *Protobuf*
    - buf_ls
        - Just need to run Mason's buf binary
        - Simple, works out of the box

## CMP: Cmp-Nvim-Lsp + Nvim-Cmp + LuaSnip
- After config:
    - Hard to setup, yet so much fun to do so
    - Forever loyal <3


## Package Manager: Lazy
- *Lazy*
    - No Notes, perfectly fine


## Colortheme: Catppuccin Mocha
- goat.
