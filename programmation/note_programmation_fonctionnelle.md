Indication sur la programmation fonctionnelle
https://en.wikipedia.org/wiki/Programming_paradigm


Comparatif de paradigme de programmation.
# programmation procédurale
- pour la programmation procedurale (ex: pascal, c), tout n'est qu'un ensemble
d'instruction pour modifier l'état d'une variable, en passant par des fonctions
ou des procédures. Cependant, contrairement à la programmation fonctionnelle, 
les fonctions ne sont pas "pure", et peuvent modifier des variables en dehors de\
leur portée (ou scope en anglais). On y retrouve la notion de boucle 

# Programmation Objet
- pour la programmation orienté object (ex: smalltalk), tout est object.
Ex: 1 est un object de type integer, pour lequel je peux envoyer des messages.
Un object peut être vu comme une cellule ou un mini-ordinateur, responsable de 
garder son état.

I made up the term 'object-oriented', and I can tell you I didn't have C++ in mind
-- Alan Kay, OOPSLA '97

## encapsulation, héritage et polymorphisme
Alan Kay définissait la programmation object comme suit:
"OOP to me means only messaging, local retention and protection and 
hiding of state-process, and extreme late-binding of all things."

- objects being like biological cells and/or individual computers on a network, 
  only able to communicate with messages
- get rid of data
- each object could have several algebras associated with it, and there could 
  be families of these, and that these would be very very useful. The term 
  "polymorphism" was imposed much later (I think by Peter Wegner) and 
  it isn't quite valid, since it really comes from the nomenclature of 
  functions, and I wanted quite a bit more than functions.

source: [http://www.purl.org/stefan_ram/pub/doc_kay_oop_en]

On associe aussi à la programmation objet les 3 caractéristique suivantes:
 * encapsulation.
 * héritage.
 * polymorphisme.

L'encapsulation permet de masquer l'état interne des objects. C'est un état qui 
est propre à l'implémentation du langage de programmation. C++ permet d'avoir 
des attributs public, private ou protected, alors qu'en Smalltalk, toutes les
variables sont privés, et les méthodes publiques. Cela veut dire aussi que l'état
interne de l'object doit être inconnu pour ses clients.

Le polymorphisme permet de définir des objets ayant des signatures identiques.
Cela permet à des objets différents d'avoir la même interface, et du coup de pouvoir 
être utilisé l'un à la place d'un autre. Les messages envoyés aux objets ne
changent pas, seul la nature du destinataire change. Pour le client, il n'a pas
à connaitre la nature de son interlocuteur, seulement son nom de variable, et le
message qu'il veut leur envoyer.

L'héritage est aussi propre à l'implémentation du langage de programmation.
C++ et Smalltalk sont des langages de Classe, alors que Javascript est un
langage de prototype. L'objectif premier de l'héritage est d'éviter la duplication
de code en permettant à des sous-classes ou sous-object de réutiliser des fonctionnalités 
et des variables de la classe mère. Cela permet aussi à des sous-objet de spécialiser
certain messages de la classe mère en les surchargeant, c'est à dire en remplaçant
la définition de la méthode d'origine avec leur propre définition. Comme la méthode
hérité agit sur le type de l'object, cela permet d'avoir une structure conditionnelle
implicite, sans mot clef, comme 'if'. Par exemple, dans Smalltalk, True et False
sont 2 classes filles de la classe Boolean.


## Design pattern

### principe de base:
 1. Programmer pour une interface, pas pour une implémentation.
 2. Favoriser la composition des objets par rapport à l'héritage.

2 objects sont assemblé ensembles (binding) soit à la compilation ou à l'exécution
(late binding). La composition des objets utilise ce mécanisme au maximum.

### Catalogue.

+--------------+-------------------------+--------------------------------------------------------------------------------------------+----------------------------------------+
| Purpose      | Design pattern          | Aspect that can vary                                                                       | technique used                         |
+--------------+-------------------------+--------------------------------------------------------------------------------------------+----------------------------------------+
| Creationnal  | Abstract Factory        | families of product object                                                                 | composition d'objet + polymorphisme    |
|              | Builder                 | how a composite object get created                                                         | composition + heritage + polymorphisme |
|              | Factory method          | Subclass of object that is instanciated                                                    | héritage + polymorphisme               |
|              | Prototype               | Class of object this is instanciated                                                       | composition d'objet + polymorphisme    |
|              | Singleton               | The sole instance of a class                                                               | encapsulation                          |
+--------------+-------------------------+--------------------------------------------------------------------------------------------+----------------------------------------+
| Structural   | Adapter                 | Interface to an object                                                                     | Interface                              |
|              | Bridge                  | Implementation of an object                                                                | Interface                              |
|              | Composite               | Structure and composition of an object                                                     | composition d'objet + polymorphisme    |
|              | Decorator               | Responsabilities of an object without subclassing                                          | composition d'objet + polymorphisme    |
|              | Façade                  | Interface to a subsystem                                                                   | Interface                              |
|              | Flyweight               | Storage cost of an object                                                                  | composition d'objet + polymorphisme    |
|              | Proxy                   | how an object is accessed, its location                                                    | Interface                              |
+--------------+-------------------------+--------------------------------------------------------------------------------------------+----------------------------------------+
| Behavioral   | Chain of responsability | Object that can fulfill a request                                                          | composition d'objet + polymorphisme    |
|              | Command                 | When and how a request is fulfilled                                                        | composition d'objet + polymorphisme    |
|              | Interpreter             | grammar and interpretation of a langage                                                    | composition d'objet + polymorphisme    |
|              | Iterator                | How an aggregate's elements are accessed, traversed                                        | polymorphisme                          |
|              | Mediator                | How and which objects interact with each other                                             | Interface                              |
|              | Memento                 | What private information is stored outside of object, and when                             | encapsulation                          |
|              | Observer                | Number of object that depend on another object; how the dependent objects stay up to date  | composition d'objet + polymorphisme    |
|              | State                   | States of an object                                                                        | composition d'objet + polymorphisme    |
|              | Strategy                | an algorithm                                                                               | polymorphisme                          |
|              | Template method         | Steps of an algorithm                                                                      | héritage                               |
|              | visitor                 | operations that can be applied to object without changing their classes                    | composition d'objet                    |
+--------------+-------------------------+--------------------------------------------------------------------------------------------+----------------------------------------+

# programmation fonctionnelle
pour la programmation fonctionnelle, tout est fonction
Ex: 1 est une fonction qui n'accepte aucun argment, et qui renvoit toujours 
l'entier 1. La programmation fonctionnelle suit une logique et une rigueur qui 
se rapproche de la rigueur mathématique. En effet, en principe, les fonctions
ne modifie pas d'états globaux - il n'est donc pas possible d'avoir d'effet de 
bord dans une fonction, et il est possible de tester une fonction de façon 
indépendante.

De la même façon, la notion de boucle, comme dans la programmation impérative, 
n'est pas répandue en programmation fonctionnelle, ou la notion de récursion 
est beaucoup plus répandue et prononcée

## lien programmation fonctionnelle et objet.
on définit une méthode "constructeur" qui renvoie une fonction anonyme (lambda) à l'exécution. 
Pour rappel, une fonction anonyme englobe (closure) les variables externe qui sont
utilisé dans son code.
Cette fonction renvoie une procédure (la fonction lambda interne), qui est prête
à répondre à certains messages. 

Il n'y a pas de classes, mais si nous définissons 2 objets avec des noms différents, 
la methode *name* renverra 2 résultats différents. Les 2 méthodes auront le 
même comportement, mais retourneront différents états.


(define (make-named-object name)
    (lambda (message)
        (cond ((eq? message 'name) (lambda (self) name))
            (else (no-method name))
        )
    )
)

source: [http://www.michaelharrison.ws/weblog/2008/07/sicp-revisited-oop-in-scheme/]

Si on assigne la fonction lambda à une variable, on retrouve bien un appel du 
type '(MyObjectInstance myMethod)'