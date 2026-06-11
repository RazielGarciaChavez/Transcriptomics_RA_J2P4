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
Reumatoïde artritis (RA) is een chronische inflammatoire auto-immuunziekte die wordt gekenmerkt door aanhoudende ontsteking van het gewrichtsslijmvlies, erosie van botten en kraakbeen, wat leidt tot gewrichtsdestructie. Het is een multifactoriële ziekte waarbij genetische en omgevingsfactoren een belangrijke rol spelen in zowel de gevoeligheid als het ontstaan ​​van deze aandoening. De verschillen in ziekteverloop bij RA-patiënten zijn ook te wijten aan genetische en moleculaire kenmerken, zoals de patronen van ontstekingsmoleculen die aanwezig zijn in het ontstoken weefsel van de aangetaste gewrichten.

# Methoden
De data is verstrekt door de Afdeling Magische Wetshandhaving en Ollivanders Wandwinkel Archieven.

De ruwe data van spreuken is eerst bewerkt voor analyse met behulp van scripts/01_clean_spell_data.R. Vervolgens zijn de spreuken geanalyseerd op kracht en nauwkeurigheid met scripts/02_spell_analysis.R.

# 📊 Resultaten
Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in deze tabel. Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht.

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In het resultaat hiervan is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek Avada Kedavra, met zowel hoge kracht als accuraatheid.

# Conclusie
