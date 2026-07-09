Voor dit transcriptomicsproject is GitHub gebruikt als versiebeheersysteem om scripts, resultaten en documentatie centraal op te slaan.

De repository is logisch opgebouwd, zodat een andere gebruiker de analyse eenvoudig kan volgen. De volgorde waarin het onderzoek is uitgevoerd, komt overeen met de volgorde waarin de onderstaande bestanden en mappen worden toegelicht.

De map  `Data/Raw`  bevat de originele FASTQ-bestanden afkomstig uit de SRA-database, die zijn gebruikt in een eerder gepubliceerd artikel waarnaar in de README regelmatig wordt verwezen.
Omdat in dit project gebruik is gemaakt van openbaar beschikbare en geanonimiseerde RNA-seq-data uit de SRA-database, zijn geen direct herleidbare persoonsgegevens verwerkt. De beschikbare data beperken zich tot leeftijd, geslacht en ziektestatus. Hierdoor is de verwerking van de gegevens in overeenstemming met de AVG (Algemene Verordening Gegevensbescherming). Hoewel de dataset openbaar beschikbaar is, is zorgvuldig omgaan met de gegevens belangrijk om verantwoord wetenschappelijk onderzoek uit te voeren en de privacy van de oorspronkelijke deelnemers te respecteren.

In de map `Bronnen` bevinden zich het hoofdartikel waaruit de ruwe data afkomstig zijn en het werkcollege waarop het opgeschoonde R-script grotendeels is gebaseerd. Overige geraadpleegde bronnen zijn vermeld in de README.

De map `Script` bevat een opgeschoond R-script dat is onderverdeeld in afzonderlijke secties voor de verschillende analysetappen, waaronder het bouwen van de referentie-index, het aligneren van de reads, het genereren van de countmatrix, de differentiële-expressieanalyse en de GO-, KEGG- en Pathview-analyses. Daarnaast zijn de gebruikte R-packages en de bijbehorende versies bovenaan het script vermeld. Door deze opbouw is de analyse overzichtelijk gestructureerd en kan de workflow eenvoudig worden gevolgd.

De map `Data/Verwerkt` bevat de met behulp van R gegenereerde BAM-bestanden.

In de map `Resultaten` zijn de gegenereerde grafieken afkomstig van de DESeq2-resultaten (volcanoplot), de GO-analyse, de KEGG-analyse en de Pathview-figuren te vinden.

Onder `Assets` bevinden zich de afbeeldingen die in de README worden gebruikt ter ondersteuning van de visualisatie, zoals het stroomschema.

Het bestand `README.md` dient als overzicht van het project en presenteert beknopt de achtergrond, methodologie, resultaten en conclusie volgens een gebruikelijke wetenschappelijke opmaak.

Het README-bestand, samen met het beschikbaar stellen van alle bronnen die in elke fase van deze studie/analyse zijn gebruikt en die vervolgens beknopt zijn gedocumenteerd in de README, bevordert de transparantie van het onderzoeksproces en vergemakkelijkt de reproduceerbaarheid van de resultaten.

