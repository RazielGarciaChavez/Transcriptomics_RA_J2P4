# Transcriptomics_Reumatoïde-artritis_Casus_J2P4
Een transcriptomics analyse gedaan mbv R om te kijken welke genen meer of minder tot expressie komen bij personen met RA in vergelijking met een gezonde controlegroep. Daarnaast werd het gekeken welke pathways betrokken zijn bij de ziekte mbv een Gene Ontology analyse (GO).
## 📁Inhoud/Structuur

- `Data/Raw` – ruwe datasets voor de analyse van de casus
- `Data/Verwerkt` - verwerkte dataset gegenereerd met scripts
- `Script` – gebruikte R scripts voor analyse uitvoering en figuren maken
- `Resultaten` - grafieken en tabellen
- `Bronnen` - gebruikte bronnen 
- `README.md` - resultaten analyse
- `assets` - overige documenten 
- `data_stewardship` - Voor de competentie beheren ga je aantonen dat je projectgegevens kunt beheren met behulp van GitHub. In deze folder kan je hulpvragen terugvinden om je op gang te helpen met de uitleg van data stewardship. 

---

# Introductie
Reumatoïde artritis (RA) is een chronische inflammatoire auto-immuunziekte die wordt gekenmerkt door aanhoudende ontsteking van het gewrichtsslijmvlies, erosie van botten en kraakbeen, wat leidt tot gewrichtsdestructie. Het is een multifactoriële ziekte waarbij genetische en omgevingsfactoren een belangrijke rol spelen in zowel de gevoeligheid als het ontstaan van deze aandoening. De verschillen in ziekteverloop bij RA-patiënten zijn ook te wijten aan genetische en moleculaire kenmerken, zoals de patronen van ontstekingsmoleculen die aanwezig zijn in het ontstoken weefsel van de aangetaste gewrichten.(bron)

Een manier om de invloed van deze genetische en moleculaire kenmerken beter te begrijpen is transcriptomics. Deze analyse maakt het mogelijk om genexpressiepatronen in weefsels te bestuderen en zo inzicht te krijgen in de moleculaire processen die betrokken zijn bij ziekteontwikkeling. In deze studie werd RNA-sequencingdata van synoviumbiopten van patiënten met RA en gezonde controles geanalyseerd in R (bron). Het doel was om verschillen in genexpressie tussen beide groepen te identificeren en betrokken biologische pathways te onderzoeken.


# Methoden
Voor deze analyse werd gebruikgemaakt van een RNA-seq-dataset uit een eerder onderzoek naar artritis door Platzer et al. (2019). Uit deze dataset werden vier monsters geselecteerd van patiënten met RA die langer dan 12 maanden aan de ziekte leden, evenals vier monsters van personen zonder RA. De reads werden met behulp van Rsubread gemapt tegen het humane referentiegenoom GRCh38. Vervolgens werd met featureCounts een countmatrix op genniveau opgesteld op basis van een GTF-annotatiebestand. De differentiële genexpressie tussen de RA- en controlegroep werd bepaald met DESeq2 in R. De lijst van significant verschillend geëxpresseerde genen werd vervolgens gebruikt voor Gene Ontology (GO)- en KEGG-pathwayanalyses om te onderzoeken welke biologische processen en signaalroutes mogelijk betrokken zijn bij reumatoïde artritis. Op basis van deze resultaten werden relevante pathways gevisualiseerd.

# 📊 Resultaten
Alignment met het menselijke referentiegenome (GRCh38) leverde 9.914 gemapte fragmenten op van de in totaal 10.000 fragmenten (99,1%). De meeste aligned reads waren correct gepaard (93,7%), wat wijst op een goede alignment-kwaliteit. In totaal werden 29.407 genen geanalyseerd. Differentiële expressieanalyse met DESeq2 identificeerde 5.119 significant verschillend geëxpresseerde genen tussen patiënten met reumatoïde artritis en gezonde controles (p < 0,05). Wanneer daarnaast een drempel van Log2 fold change > 1 werd toegepast, bleven 4.572 genen significant. 
De vulkaanplot visualiseert de geanalyseerde genen en scheidt de statistisch significante genen door middel van kleur, waarbij een iets grotere groep omlaag gereguleerde genen te zien is dan omhoog gereguleerde genen. De meest significant omlaag gereguleerde genen omvatten onder andere ANKRD30BL, MT-ND6, RAB3IL1, SLC9A3R2 en ZNF598. Daarentegen was het meest omhoog gereguleerde gen in RA-monsters SRGN.
Bij de GO-analyse waren verschillende verrijkte GO-termen geassocieerd met B-cel- en T-celfunctie, waaronder B-celgemedieerde immuniteit, antigeenreceptor-gemedieerde signaalroute en adaptieve immuunrespons gebaseerd op somatische recombinatie van immuunreceptoren. Op basis van de observaties van de GO-analyse werden pathways gevisualiseerd, plus een pathway die zich uitsluitend richtte op de ziekte zelf (zie Figuren 4, 5 en 6).
De KEGG-pathway toonde meer pathways aan, waaronder MAPK-signaleringsroute vertoonde de hoogste verrijking, gevolgd door NOD-achtige receptorsignalering, TNF-signalering, NF-κB-signalering, IL-17-signalering en Th17-celdifferentiatie. 

# Conclusie

