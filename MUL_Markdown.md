Title:  Utilisation du Markdown avec Pandoc
Author:  Baptiste PIERARD
Date:    14 septembre 2015

INTRODUCTION
==================

But, Responsabilités, Domaine d’application
--------------------------------------------

### Objectifs

Ce paragraphe donne la raison d’être du document. Il s’articule de la manière suivante :
 - But du système dans une description rapide.
 - But du Sous-Système dans une description rapide.
 - But du document.

Cette description de quelques lignes apparaîtra dans tous les documents relatifs au sous-système. Il est conseillé de recopier mot pour mot cette description sur l'ensemble des documents.

### Responsabilités

Ce paragraphe donne les responsabilités associées au document, notamment :
 - le nom de l’auteur ou de l’équipe de rédaction,
 - le nom du vérificateur,
 - le nom de celui qui approuve le document.

Si ces informations sont déjà données dans le Plan Qualité du projet, il faut l’indiquer par la phrase suivante :

Les responsabilités associées à ce document sont définies dans le Plan Qualité du Projet.

### Domaine d’application

Ce paragraphe précise à quel sous-ensemble du projet correspond ce document, et à quelle version du ou des composants. Par exemple s’il s’agit d’un logiciel :

Ce document correspond à la version VXXX.Y du logiciel...

Hypothèses
----------------

Ce paragraphe décrit les hypothèses utilisées pour la rédaction.
Les parties en italiques dans ce modèle sont des guides de rédactions.

Documents applicables, de référence
------------------------------------

Ces paragraphes donnent la liste des documents d’entrée de ce document.

### Documents Médiane Système applicables
Doivent au moins apparaître 
 - le Manuel Qualité de Médiane Système,
 - le Plan Qualité du projet
puis,
 - la Spécification si ce document est une Conception,
 - et ainsi de suite...

| Abréviation | Nom du document      | Description et/ou titre         | Version |    Date    |
|:-----------:|:---------------------|:--------------------------------|:-------:|:----------:|
| [MQE]       | SysQ_MQE_N.n.DOC     | Manuel Qualité et Environnement | 1.0     | jj/mm/aaaa |
| [PQP]       | AAAA_PQP_N.n.DOC     | Plan Qualité Projet             | 2.0     | jj/mm/aaaa |

  : Documents applicables.

### Documents externes applicables

Peuvent apparaître :
 - le Cahier des charges si ce document est une Spécification,
 - des spécifications client,
 - et ainsi de suite...

| Abréviation | Nom du document      | Description et/ou titre         | Version |    Date    |
|:-----------:|:---------------------|:--------------------------------|:-------:|:----------:|
| [CdC]       | CdC_Projet_Toto      | Cahier Des Charges              | 1.0a    | jj/mm/aaaa |

  : Documents exernes applicables.

### Documents de référence
Un document de référence est un document utilisé pour la rédaction de cette spécification :
 - guide de rédaction,
 - manuel utilisateur d'un logiciel,
 - règlements
 - etc...
 
Les documents cités doivent être identifiés de la même manière que pour les documents applicables.

| Notation abrégée | Titre                   | Référence                       | Version |    Date    |
|:----------------:|:------------------------|:--------------------------------|:-------:|:----------:|
| RdC              | Règles de Codage C      | ???                             | 1.0     | jj/mm/aaaa |

  : Identification des documents.
  



Terminologie
-------------------

Ce paragraphe permet au lecteur néophyte de se débrouiller dans la jungle des sigles et symboles du projet...
Ne pas hésiter à renvoyer à un document donnant une définition exacte des sigles ou noms les plus importants.

+------------------+----------------------------------------------------------+
| Terme ou symbole | Correspondance                                           |
+==================+==========================================================+
| **RTFM**         | **R**ead **T**he **F**ile **M**anual                     |
|                  |                                                          |
|                  | Ayez l'obligeance de vous reporter au manuel utilisateur |
+------------------+----------------------------------------------------------+
| **PDJ**          | **P**etit **D**é**J**euner                               |
|                  |                                                          |
|                  | Repas le plus important de la journée                    |
+------------------+----------------------------------------------------------+

CONTENU DU DOCUMENT...
=======================

Ce document présente l'architecture générale du logicel : 

![Figure 1 : Composants principaux du projet](images\UML_architecture.png)

Voici un diagramme de séquences entièrement rédigé en mode texe :

![Figure 2 : Diagramme de séquence PlantUML](images\UML_DiagSeq.png)


Titre de niveau 1
=================

Titre de niveau 2
-----------------

### Titre de niveau 3

ceci est un paragraphe. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nunc vitae nulla feugiat tempor eu vitae lacus. Vestibulum malesuada consequat magna at eleifend. In hac habitasse platea dictumst. Cras placerat molestie sem non feugiat. Etiam sit amet metus vel ligula egestas laoreet non sit amet lacus. Praesent quis quam non augue pellentesque placerat. Sed et leo id odio imperdiet tempor. In dapibus elit in mauris hendrerit dictum. Donec quis nibh eu ipsum auctor varius. Pellentesque quis scelerisque tellus. Etiam a augue nulla. Nam placerat mi ac massa mattis, nec vehicula diam interdum. Aliquam erat volutpat. Ut eu tempor risus.

Phasellus rutrum vehicula sapien, ut maximus felis. Mauris blandit lectus convallis tellus porta varius. Vestibulum et aliquam felis, at semper ex. Etiam convallis urna sit amet pulvinar finibus. Duis bibendum metus congue ex eleifend, ac consectetur diam lobortis. Aliquam porttitor leo diam, ac tempus odio semper a. Nullam eu imperdiet metus. Nunc sem ligula, finibus non metus eu, congue consequat eros. Integer mattis pulvinar consectetur. Phasellus eget augue sit amet nibh iaculis sagittis. Aenean sed nisl nec libero semper dignissim. Fusce a urna bibendum, pharetra leo viverra, tristique urna. Nullam felis neque, faucibus sit amet mi ac, hendrerit euismod orci. Nulla facilisi. Morbi tristique tempus risus. Vestibulum finibus risus arcu, non tempus risus vehicula eget.

Suspendisse scelerisque mollis libero, eu maximus enim interdum a. Fusce congue, nisl et tristique ullamcorper, libero sapien tincidunt risus, vel gravida nunc elit eget magna. In hac habitasse platea dictumst. Praesent nec est sit amet nunc mollis accumsan vitae sit amet massa. Proin et ligula a magna laoreet consectetur. Nullam iaculis leo in urna efficitur, sed tincidunt tellus mollis. Fusce feugiat auctor urna sed fermentum.

### Titre de niveau 3

Et voila un exemple de liste non-numérotée :
 - pomme
 - poire
 - carotte
 - navet
 
Voici un exemple de liste numérotée :
 1. Tintin
 2. Milou
 2. Haddock
 
### Titre de niveau 3

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nunc vitae nulla feugiat tempor eu vitae lacus. Vestibulum malesuada consequat magna at eleifend. In hac habitasse platea dictumst. Cras placerat molestie sem non feugiat. Etiam sit amet metus vel ligula egestas laoreet non sit amet lacus. Praesent quis quam non augue pellentesque placerat. Sed et leo id odio imperdiet tempor. In dapibus elit in mauris hendrerit dictum. Donec quis nibh eu ipsum auctor varius. Pellentesque quis scelerisque tellus. Etiam a augue nulla. Nam placerat mi ac massa mattis, nec vehicula diam interdum. Aliquam erat volutpat. Ut eu tempor risus.

 > Ceci est une citation : « C’est curieux chez les marins ce besoin de faire des phrases ! »

Autre titre de niveau 2
-----------------------

Ce fichier `.md` est encodé en UTF8, pour ne pas avoir de problème lors de l'utilisation de caractères accentués ou spéciaux.

Exemple de code source en C :

```c
#include "triangle.h"
#include <math.h>

//====================================================================
// Determination du type d'un triangle
//====================================================================
char* QualifierTriangle(unsigned int a, unsigned int b, unsigned int c)
{
	if( a+b<=c || b+c<=a || c+a<=b )
	{
		return "impossible";
	}
	else
	{
		unsigned int egalite=0;
		if (a==b) egalite++;
		if (a==c) egalite++;
		if (c==b) egalite++;

		if (egalite==0)		 return "quelconque";
		else if (egalite==1) return "isocele";
		else 				 return "equilateral";
	}
}
```

avec le logigramme associé, rédigé en mode texte, et traité par le logiciel PlantUML pour en générer une image :

![Figure 3 : Logigramme de qualification d'un triangle](images\UML_logigramme.png)

ou bien en java
```java
public class HelloWorld {

	public static void main(String[] args) {
		System.out.println("Hello, World");
	}

}
```

ou bien en python (*on appréciera au passage la concision du language par rapport au java !*) :
```python
print "Hello World"
```
Exemple de diagrammes de temps généré à l'aide de PlantUML :

![Figure 4 : Diagramme de temps : Affichage d'une page Web](images\UML_timing.png)

Exemples de diagrammes de Gantt générés à l'aide de PlantUML :

![Figure 5 : Diagramme de Gantt](images\UML_gantt.png)

![Figure 6 : Diagramme de Gantt](images\UML_gantt_001.png)

![Figure 7 : Diagramme de Gantt](images\UML_gantt_002.png)
