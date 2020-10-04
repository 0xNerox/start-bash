# définition de ma_fonction
 function ma_fonction {
    ls /sys
    ls /proc
 }

 # appel de la fonction
 ma_fonction | grep cpu

 # Une fonction fonctionne à peu prés comme une commande de base ou un sous-script. On peut lui passer des paramètres ($1 / $2), elle a une valeur de retour avec le mot clef return à la place du exit. On peut même utiliser avec elle les redirections pipes compris comme nous le voyons dans l'exemple En somme la seule différence entre une fonction et un script ou une commande externe c'est qu'il n'y a pas création du nouveau processus




 # Maintenant ce que l'on sait moins c'est qu'une fonction en Bash est en réalité un cas particulier d'un concept plus large, celui de bloc de code. Il est ainsi possible de créer des fonctions qui n'ont pas de nom au sein d'un script. Ainsi le code précédent peut s'écrire de la manière suivante :

{
     ls /sys
     ls /proc
} | grep cpu

# Autre exemple pratique, d'utilisation d'un bloc pour conditionner l'exécution d'une série de commande au bon déroulement d'une première commande :

command1 && {
   sous-commande1
   sous-commande2
   ...
}

# En somme un bloc est une fonction anonyme, qui s'exécute tout de suite, qui ne peut avoir de passage paramètre ($1, $2...) et ne peut renvoyer de code de retour (return). Tout le reste est possible. Maintenant comme une fonction est un bloc, la logique nous souffle que s'il est possible de mettre un bloc dans une fonction, il doit aussi être possible de placer une fonction dans une autre fonction :

function testa {
      function testb {
       echo "Je suis dans testb"
      }
   echo "Je suis dans testa"
    testb
}
testa

# Et effectivement cela fonctionne très bien, de même que mettre une fonction dans un bloc anonyme... Maintenant on peut se demander quelle sont les règles de visibilités sur les fonctions. Deux fonctions dans deux bloc distinct peuvent t-elles s'appeler ? La réponse à cette question passe par une petite manipulation :

function test2 {
  echo "Je suis dans test2"
}
set | grep test2

# Si on exécute ce script : 

gaston./test?sh
test2 ()
echo "Je suis dans test2"


#Ainsi une fonction n'est rien d'autre qu'une variable. Du coup, la réponse à notre question réside dans les régles de visibilités qui leur sont associées.

#Pour terminer sur les blocs de code, sachez que TOUT n'est que block de code. Et une commande seule est un bloc dont les accolades ont été rendues optionnelles. Ainsi les deux syntaxe suivantes sont équivalentes :
echo -e "coucou\nsalut\n" | grep "coucou"

# est équivalent à
{
  echo -e "coucou\nsalut\n"
} | {
  grep "coucou"
}