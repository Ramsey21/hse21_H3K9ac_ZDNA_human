# hse21_H3K9ac_ZDNA_human

### Cтудент - Саликова Дарья
| Организм      | Структура ДНК | Гистоновая метка | Тип клеток| .bed файл 1| .bed файл 2  |
| ------------- |:-------------:|:----------------:|:---------:|:----------:|:------------:|
| human(hg38)   | ZDNA          | H3K9ac           | H1      | ENCFF679LHF| ENCFF719SGF |

## Анализ пиков гистоновой метки

С помощью команды wget были получены файлы с пиками ENCFF148UQI и ENCFF891CHI :

`wget https://www.encodeproject.org/files/ENCFF679LHF/@@download/ENCFF679LHF.bed.gz` 

`wget https://www.encodeproject.org/files/ENCFF719SGF/@@download/ENCFF719SGF.bed.gz`

Были оставлены только первые пять столбцов:

`zcat ENCFF679LHF.bed.gz | cut -f1-5 > H3K9ac_H1.ENCFF679LHF.hg38.bed` 

`zcat ENCFF719SGF.bed.gz | cut -f1-5 > H3K9ac_H1.ENCFF719SGF.hg38.bed`

## Гистограммы длин участков пиков гистоновой метки

<p float="left">
  <img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/len_hist.H3K9ac_H1.ENCFF679LHF.hg38.png" />
  <img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/len_hist.H3K9ac_H1.ENCFF679LHF.hg19.png" />
</p>

<p float="left">
  <img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/len_hist.H3K9ac_H1.ENCFF719SGF.hg38.png" />
  <img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/len_hist.H3K9ac_H1.ENCFF719SGF.hg19.png" />
</p>

## Распредление длин пиков после фильтраци ( < 5000)

<p float="left">
  <img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/filter_peaks.H3K9ac_H1.ENCFF679LHF.hg19.init.hist.png" />
  <img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/filter_peaks.H3K9ac_H1.ENCFF679LHF.hg19.filtered.hist.png" />
</p>

<p float="left">
  <img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/filter_peaks.H3K9ac_H1.ENCFF719SGF.hg19.init.hist.png" />
  <img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/filter_peaks.H3K9ac_H1.ENCFF719SGF.hg19.filtered.hist.png" />
</p>

## Расположение пиков гистоновой метки H3K9ac относительно аннотироанных генов

<p float="left">
  <img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/chip_seeker.H3K9ac_H1.ENCFF679LHF.hg19.filtered.plotAnnoPie.png" />
  <img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/chip_seeker.H3K9ac_H1.ENCFF719SGF.hg19.filtered.plotAnnoPie.png" />
</p>

Объединяем файлы с пиками с помощью bedtools

`cat  *.filtered.bed  |   sort -k1,1 -k2,2n   |   bedtools merge   >  H3K9ac_H1.merge.hg19.bed`

Визуализируем в геномном браузере файлы с пиками и файл с объединенными пиками: 

`track visibility=dense name="ENCFF679LHF" description="H3K9ac_H1.ENCFF679LHF.hg19.filtered.bed"
https://raw.githubusercontent.com/Ramsey21/hse21_H3K9ac_ZDNA_human/master/data/H3K9ac_H1.ENCFF679LHF.hg19.filtered.bed`

`track visibility=dense name="ENCFF719SGF"  description="H3K9ac_H1.ENCFF719SGF.hg19.filtered.bed"
https://raw.githubusercontent.com/Ramsey21/hse21_H3K9ac_ZDNA_human/master/data/H3K9ac_H1.ENCFF719SGF.hg19.filtered.bed`

`track visibility=dense name="ChIP_merge"  color=50,50,200   description="H3K9ac_H1.merge.hg19.bed"
https://raw.githubusercontent.com/Ramsey21/hse21_H3K9ac_ZDNA_human/master/data/H3K9ac_H1.merge.hg19.bed`

Убеждаемся в корректности работы bedtools:

<img alt="ex0" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/image_merge.PNG">



## Анализ участков вторичной структуры ДНК
### Распределение длин участков вторичной структуры ДНК 

<img width="60%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/len_hist.DeepZ.png" />

### Расположение участков вторичной структуры относительно аннотированных генов

<img width="60%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/chip_seeker.DeepZ.plotAnnoPie.png" />

## Анализ пересечений гистоновой метки и структуры ДНК

Находим пересечения между гистоновой меткой и ZDNA

`bedtools intersect -a DeepZ.bed -b H3K9ac_H1.merge.hg19.bed > H3K9ac_H1.intersect_with_DeepZ.hg19.bed`

### Распределние длин участков пересечений

<img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/len_hist.H3K9ac_H1.intersect_with_DeepZ.hg19.png" />

### Визуализация в геномном браузере исходных участков структуры ДНК, а также их пересечения с гистоновой меткой

`track visibility=dense name="DeepZ"  color=0,200,0  description="DeepZ"
https://raw.githubusercontent.com/Ramsey21/hse21_H3K9ac_ZDNA_human/master/data/DeepZ.bed`

`track visibility=dense name="intersect_with_DeepZ"  color=200,0,0  description="H3K9ac_H1.intersect_with_DeepZ.bed"
https://raw.githubusercontent.com/Ramsey21/hse21_H3K9ac_ZDNA_human/master/data/H3K9ac_H1.intersect_with_DeepZ.bed`

Координаты: chr1:894,102-895,091

<img alt="ex1" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/image_intersect.PNG">

[Ссылка](https://genome.ucsc.edu/s/Ramsey217/intersect) на сохранную сессию

### Ассоциируем полученные пересечения с ближайшими генами

<img width="45%" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/chip_seeker.H3K9ac_H1.intersect_with_DeepZ.plotAnnoPie.png" />

Всего [8760](https://raw.githubusercontent.com/Ramsey21/hse21_H3K9ac_ZDNA_human/master/data/H3K9ac_H1.intersect_with_DeepZ.genes.txt) пиков, ассоциированных с генами, из них [5672](https://github.com/zradmila/hse21_H3K9ac_ZDNA_human/blob/main/data/H3K9ac_k562.intersect_with_DeepZ.genes_uniq.txt) уникальных

## GO-анализ

Был проведен GO-анализ для уникальных генов с использованием сайта http://pantherdb.org/ 

<img width="946" alt="go_analysis" src="https://github.com/Ramsey21/hse21_H3K9ac_ZDNA_human/blob/master/images/go.PNG">

Полный список категорий приведен [здесь](https://raw.githubusercontent.com/Ramsey21/hse21_H3K9ac_ZDNA_human/master/data/pantherdb_GO_analysis.txt)
