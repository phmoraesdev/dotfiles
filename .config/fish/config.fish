if status is-interactive
    set fish_greeting ""
    
    # Cores personalizadas
    set -l azul 6CB6FF
    set -l verde 5FD7A7
    set -l vermelho FF6B6B
    set -l cinza 8A8F98
    
    function fish_prompt
        set_color $azul --bold
        echo -n (prompt_pwd)
        
        if git rev-parse --is-inside-work-tree >/dev/null 2>&1
            set_color $verde
            echo -n " | "(git branch --show-current)
        end
        
        echo
        
        if test $status -eq 0
            set_color $verde --bold
            echo -n "› "
        else
            set_color $vermelho --bold
            echo -n "! "
        end
        
        set_color normal
    end
    
    function fish_right_prompt
        set_color $cinza
        echo -n "→ "(whoami)
        set_color normal
    end
    
    alias ls "ls --color=auto"
    
end
