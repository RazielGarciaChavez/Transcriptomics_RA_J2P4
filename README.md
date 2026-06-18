# Transcriptoomanalyse van synoviumweefsel onthult verhoogde immuunactivatie en ontstekingssignalering bij reumatoïde artritis
Een transcriptomics analyse gedaan mbv R om te kijken welke genen meer of minder tot expressie komen bij personen met RA in vergelijking met een gezonde controlegroep. Daarnaast werd het gekeken welke pathways betrokken zijn bij de ziekte mbv een Gene Ontology analyse (GO).
## 1. Inhoud/Structuur

- `Data/Raw` – ruwe datasets voor de analyse van de casus
- `Data/Verwerkt` - verwerkte dataset gegenereerd met scripts
- `Script` – gebruikte R scripts voor analyse uitvoering en figuren maken
- `Resultaten` - grafieken en tabellen
- `Bronnen` - gebruikte bronnen 
- `README.md` - resultaten analyse
- `assets` - overige documenten 
- `data_stewardship` - Voor de competentie beheren ga je aantonen dat je projectgegevens kunt beheren met behulp van GitHub. In deze folder kan je hulpvragen terugvinden om je op gang te helpen met de uitleg van data stewardship. 

# 2. Introductie
Reumatoïde artritis (RA) is een chronische inflammatoire auto-immuunziekte die wordt gekenmerkt door aanhoudende ontsteking van het gewrichtsslijmvlies, erosie van botten en kraakbeen, wat leidt tot gewrichtsdestructie. Het is een multifactoriële ziekte waarbij genetische en omgevingsfactoren een belangrijke rol spelen in zowel de gevoeligheid als het ontstaan van deze aandoening. De verschillen in ziekteverloop bij RA-patiënten zijn ook te wijten aan genetische en moleculaire kenmerken, zoals de patronen van ontstekingsmoleculen die aanwezig zijn in het ontstoken weefsel van de aangetaste gewrichten (Jahid et al., 2023).

Een manier om de invloed van deze genetische en moleculaire kenmerken beter te begrijpen is transcriptomics. Deze analyse maakt het mogelijk om genexpressiepatronen in weefsels te bestuderen en zo inzicht te krijgen in de moleculaire processen die betrokken zijn bij ziekteontwikkeling. 
In deze studie werd RNA-sequencingdata van synoviumbiopten van patiënten met RA en gezonde controles geanalyseerd in R (Platzer Id et al., 2019). Het doel was om verschillen in genexpressie tussen beide groepen te identificeren en betrokken biologische pathways te onderzoeken.



# 3. Methoden
Voor deze analyse werd gebruikgemaakt van een RNA-seq-dataset uit een eerder onderzoek naar artritis door Platzer et al. (2019). Uit deze dataset werden vier monsters geselecteerd van patiënten met RA die langer dan 12 maanden aan de ziekte leden, evenals vier monsters van personen zonder RA. 
<br>
<table>
  <caption><b>Tabel 1. </b> Overzicht van synoviumbiopten samples afkomstig uit een eerder uitgevoerd onderzoek (Platzer et al., 2019). </caption>
 <thead>
    <tr>
      <th align="left">FASTQ</th>
      <th align="left">Leeftijd</th>
      <th align="left">Geslacht</th>
      <th align="left">Groep</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="left"><b>SRR4785819</b></td>
      <td align="left">31</td>
      <td align="left">female</td>
      <td align="left">Normal</td>
    </tr>
      <td align="left"><b>SRR4785820</b></td>
      <td align="left">15</td>
      <td align="left">female</td>
      <td align="left">Normal</td>
    </tr>
      <td align="left"><b>SRR4785828</b></td>
      <td align="left">31</td>
      <td align="left">female</td>
      <td align="left">Normal</td>
    </tr>
      <td align="left"><b>SRR4785831</b></td>
      <td align="left">42</td>
      <td align="left">female</td>
      <td align="left">Normal</td>
    </tr>
      <td align="left"><b>SRR4785979</b></td>
      <td align="left">54</td>
      <td align="left">female</td>
      <td align="left">Rheumatoid arthritis (established)</td>
    </tr>
      <td align="left"><b>SRR4785980</b></td>
      <td align="left">66</td>
      <td align="left">female</td>
      <td align="left">Rheumatoid arthritis (established)</td>
    </tr>
      <td align="left"><b>SRR4785986</b></td>
      <td align="left">60</td>
      <td align="left">female</td>
      <td align="left">Rheumatoid arthritis (established)</td>
    </tr>
      <td align="left"><b>SRR4785988</b></td>
      <td align="left">59</td>
      <td align="left">female</td>
      <td align="left">Rheumatoid arthritis (established)</td>
    </tr>
  </tbody>
</table>

<br>

## 3.1 RNA-seq verwerking en genkwantificatie
Sequencing libraries were prepared using the TruSeq Stranded Total RNA RiboZero protocol and sequenced on an Illumina HiSeq 2000 platform using paired-end 100 bp reads (GSM2371053: Rheumatoid Arthritis Tissue 18; Homo Sapiens; RNA-Seq - SRA - NCBI, n.d.-b). De reads werden met behulp van Rsubread gemapt tegen het humane referentiegenoom GRCh38. Vervolgens werd met featureCounts een countmatrix op genniveau opgesteld op basis van een GTF-annotatiebestand. 

## 3.2 Analyses
De differentiële genexpressie tussen de RA- en controlegroep werd bepaald met DESeq2 in R. De lijst van significant verschillend geëxpresseerde genen werd vervolgens gebruikt voor Gene Ontology (GO)- en KEGG-analyses om te onderzoeken welke biologische processen en signaalroutes mogelijk betrokken zijn bij reumatoïde artritis. Op basis van deze resultaten werden relevante pathways gevisualiseerd.
<p align="center">
  <img width="400" height="500" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Assets/StroomschemaTranscriptomics.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 1. Data verwerking en analyse stroomschema. </b> Ruwe RNA-seq data werden gemapt op het referentiegenoom (GRCh38), waarna een countmatrix werd gegenereerd met featureCounts. Differentiële genexpressieanalyse werd uitgevoerd met DESeq2 en gevisualiseerd met een volcanoplot met EnhancedVolcano. De geïdentificeerde differentieel geëxpresseerde genen werden vervolgens gebruikt voor Gene Ontology (GO)- en KEGG-verrijkingsanalyses, gevolgd door pathway-visualisatie en biologische interpretatie van de resultaten. </em>
</p>

<br>

# 4. Resultaten

## 4.1 Alignment- en differentiële genexpressieanalyse
Alignment met het menselijke referentiegenome (GRCh38) leverde 9.914 gemapte fragmenten op van de in totaal 10.000 fragmenten (99,1%). De meeste aligned reads waren correct gepaard (93,7%), wat wijst op een goede alignment-kwaliteit. In totaal werden 29.407 genen geanalyseerd. Differentiële expressieanalyse met DESeq2 identificeerde 5.119 significant verschillend geëxpresseerde genen tussen patiënten met reumatoïde artritis en gezonde controles (p < 0,05). Wanneer daarnaast een drempel van Log2 fold change > 1 werd toegepast, bleven 4.572 genen significant. 
De vulkaanplot visualiseert de geanalyseerde genen en scheidt de statistisch significante genen door middel van kleur, waarbij een iets grotere groep omlaag gereguleerde genen te zien is dan omhoog gereguleerde genen. De meest significant omlaag gereguleerde genen omvatten onder andere ANKRD30BL, MT-ND6, RAB3IL1, SLC9A3R2 en ZNF598. Daarentegen was het meest omhoog gereguleerde gen in RA-monsters SRGN.
<p align="center">
  <img width="400" height="500" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/Volcanoplot.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 2. Differentiële expressie vulkaanplot tussen synoviumweefsel van RA patiënten en gezonde controles. </b> Op de x-as staat de log₂ fold change van de genexpressie en op de y-as de −log₁₀(p-waarde). Rode punten representeren genen die zowel een significante verandering in expressie als een relevante fold change vertonen. Groene punten voldoen uitsluitend aan de fold-change drempel en grijze punten zijn niet significant. Zowel op- als neergereguleerde genen werden waargenomen, waarbij meerdere genen een sterke verandering in expressie vertoonden. Figuur gevisualiseerd met het R-pakket EnhancedVolcano. </em>
</p>

<br>

## 4.2 Gene Ontology-verrijkingsanalyse
Bij de GO-analyse waren verschillende verrijkte GO-termen geassocieerd met B-cel- en T-celfunctie, waaronder B-celgemedieerde immuniteit, antigeenreceptor-gemedieerde signaalroute en adaptieve immuunrespons gebaseerd op somatische recombinatie van immuunreceptoren. Op basis van de observaties van de GO-analyse werden pathways gevisualiseerd, plus een pathway die zich uitsluitend richtte op de ziekte zelf (zie Figuren 4, 5 en 6).

<p align="center">
  <img width="500" height="500" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/GOanalysis.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 3. Gene Ontology (GO) verrijkingsanalyse van differentieel geëxpresseerde genen tussen RA patiënten en gezonde controles. </b> De y-as toont de verrijkte biologische processen, terwijl de x-as het percentage differentieel geëxpresseerde genen binnen elk GO-term weergeeft (Hits %). De grootte van de punten correspondeert met het aantal genen dat aan een GO-term is gekoppeld en de kleur geeft de significantie van de verrijking weer als −log10(FDR). De meest verrijkte processen waren gerelateerd aan immuunfunctie, waaronder lymfocytdifferentiatie, leukocyt-gemedieerde immuniteit, T-celdifferentiatie en B-cel-gemedieerde immuniteit. De analyse werd uitgevoerd met behulp van het R-pakket clusterProfiler in combinatie met de database voor menselijke genannotatie org.Hs.eg.db. GO-termen werden gevisualiseerd met behulp van dotplots die gegenereerd werden met clusterProfiler, dat gebaseerd is op ggplot2. </em>
</p>

<br>

## 4.3 Pathways

<p align="center">
  <img width="700" height="700" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/hsa04660.pathview.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 4. </b> T-cel pathway beschrijving moet nog!!! </em>
</p>

<br>

<p align="center">
  <img width="700" height="700" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/hsa04662.pathview.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 5. </b> b-cel pathway beschrijving moet nog!!! </em>
</p>

<br>

<p align="center">
  <img width="700" height="700" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/hsa05323.pathview.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 6. </b> RA pathway beschrijving moet nog!!! </em>
</p>

<br>

## 4.4 KEGG-pathwayanalyse
De KEGG-pathway toonde meer pathways aan, waaronder MAPK-signaleringsroute vertoonde de hoogste verrijking, gevolgd door NOD-achtige receptorsignalering, TNF-signalering, NF-κB-signalering, IL-17-signalering en Th17-celdifferentiatie. 
 <p align="center">
  <img width="600" height="700" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/KEGGresultaten.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 7. </b> KEGG beschrijving moet nog!!! </em>
</p>

<br>

# 5. Conclusie
In deze studie werd RNA-sequencingdata van synoviumbiopten van RA-patiënten en gezonde controles transcriptomisch geanalyseerd in R. De resultaten tonen significante verschillen in genexpressie tussen beide groepen.

DESeq2 differentiële expressieanalyse resultaten wijzen op uitgebreide veranderingen in genexpressie tussen RA patiënten en gezonde controles. De genen die betrokken zijn bij zowel de verhoogde als de verlaagde expressie suggereren dat immuunactivering, ontstekingsprocessen, veranderingen in cellulaire signalering en energiemetabolisme een rol spelen bij reumatoïde artritis.

Terwijl de GO-analyse veel immuungerelateerde biologische processen identificeerde onder de differentieel tot expressie gebrachte genen, toonde de KEGG-analyse ook pathways aan die betrokken zijn bij immuunregulatie, ontsteking, cytokineproductie, activatie van immuuncellen en chronische ontstekingsreacties.

Een beperking van deze studie is dat alle monsters afkomstig waren van vrouwelijke patiënten, wat kan hebben geleid tot seksegerelateerde vertekening. Toekomstig onderzoek kan daarom monsters van beide geslachten gebruiken of zich richten op enkele genen en signaalroutes die verschillen tussen RA-patiënten en gezonde controles.

# 6. Literatuurlijst

Jahid, M., Khan, K. U., Rehan-Ul-Haq, & Ahmed, R. S. (2023). Overview of Rheumatoid Arthritis and Scientific Understanding of the Disease. Mediterranean Journal of Rheumatology, 34(3), 284. https://doi.org/10.31138/MJR.20230801.OO

Platzer Id, A., Nussbaumer Id, T., Karonitsch, T., Smolen, J. S., & Aletaha, D. (2019). Analysis of gene expression in rheumatoid arthritis and related conditions offers insights into sex-bias, gene biotypes and co-expression patterns. https://doi.org/10.1371/journal.pone.0219698

GSM2371053: rheumatoid arthritis tissue 18; Homo sapiens; RNA-Seq - SRA - NCBI. (n.d.-b). https://www.ncbi.nlm.nih.gov/sra?term=SRX2316126&utm

# AI- Disclaimer
Bij de uitvoering van dit project is gebruikgemaakt van een AI-assistent voor ondersteuning bij programmeervragen, data-analyse en taalcorrectie. Alle resultaten, interpretaties en conclusies zijn door de student zelfstandig gecontroleerd en vastgesteld.
