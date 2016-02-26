# Essayez pandoc !

Présentation lors de la [séance du Club-Méta du 8 décembre 2015](http://club-meta.fr/2015/12/08/club-meta/).

**pandoc**, c'est un couteau suisse qui convertit de tout vers tout.  
Notamment Markdown vers HTML, LaTeX, Beamer ou même `.docx`. Et c'est codé en Haskell.

## Installation

Si vous êtes sur Mac, `brew install pandoc`.  
Sinon, vous pouvez télécharger pandoc sur [le site officiel](http://pandoc.org/installing.html) (qui renvoie vers [leur GitHub](https://github.com/jgm/pandoc/releases/)).

## Commandes

    hg clone https://jilljenn@bitbucket.org/jilljenn/trypandoc
    cd trypandoc
    make

Pour avoir une idée des commandes à taper, regardez ce Makefile. Il est également possible de faire par exemple : `pandoc -f docx -t markdown` pour convertir de `.docx` vers Markdown. Et ça conserve même les formules de maths. MAGIC.

    all:
        pandoc -s -t html pandoc.md -o pandoc.html
        pandoc -t latex pandoc.md -o pandoc.pdf
        pandoc -s -t beamer pandoc.md -o pandoc.tex
        pandoc -s -t docx pandoc.md -o pandoc.docx
        pandoc -t beamer pandoc.md -o slides.pdf
        pandoc -s -t beamer pandoc.md -o slides.tex

Note : ici, `-f markdown` n'est pas nécessaire, car deviné à partir de l'extension.

## Bonus

Il y a plein d'options, on peut :

- ajouter une table des matières (et `--toc`) ;
- numéroter les sections (`-N`) ;
- ajouter des footnotes (`[^1]`) ;
- activer MathJax (`--mathjax`) ;
- activer le français (`-M lang=fr`)
- ajouter un CSS (`-c bootstrap.min.css`)
- inclure une bibliographie (plus compliqué déjà, [voir la doc](http://pandoc.org/README.html)).

### Template maison

Si vous incluez Bootstrap par exemple, vous aurez besoin d'un template HTML maison (pour ajouter `class="container"`).

Pour ce faire, récupérez le template par défaut :

    pandoc -D html > page.html

Et puis modifiez-le avant d'appeler :

    pandoc --template=page.html -t html pandoc.md -o pandoc.html
