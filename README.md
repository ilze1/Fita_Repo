# Fita_Repo done tasks
# Organizatoriskie uzdevumi
## Github projekta izveidošanā
1 p

- [x] Izveidot koplietošanas repozitoriju.
- [x] Pievienot **.gitignore** failu, lai ignorētu nevēlamus failus (piem., Terraform stāvokļa failus, slepenos atslēgu failus utt.).
- [x] Pievienot lietotājus.
- [x] Sadalīt lomas.
- [x] Sadalīt uzdevumus.
- [x] Pievienot **README** failu ar projekta aprakstu un pamatinstrukcijām.


# Projekta uzdevumi:
### Papilduzd
- [x] Pievienota apakšmape, kurā iekopēts petclinit src (Irina)
- [x] Uztaisīja development branch un pull request (Gaļina)
- [x] Kopā uzlikām secure main brach
- [x] Izveidot Dynamodb tabulu izmantojot GitHub Actions (Ainārs)

## _Infrastrukturas_ izveidošana
4 p

**Nepieciešams serveris:**
- T2.large
- Ubuntu OS
- S3 bucket

- [x] Izmantojot **Terraform** izveidot **EC2** infrastruktūru, ar **ssh** piekļuvēm. Publisko un privāto tīklu.
- [x] Izveidot Terraform mapes struktūru (piem., "modules", "environments").
- [x] Izveidot dokumentāciju Terraform.
- [x] Izmantojot **GitHub Actions**  izveidot **S3**.
- [x] Veikt S3 bucket politikas konfigurēšanu, lai nodrošinātu piekļuves kontroli.
- [x] Testi.
- [x] Papildināt repozitoriju.
- [x] Papildināt wiki.
- [x] Wiki izveidot DONE page. Aprakstīt padarīto.
- [x] Izmantojot **row.io** aprakstīt infrastruktūru. Bildes izvietot projekta Wiki.

## _Docker_ uzstādīšana
2 p

- [x] Pieslēgties **EC2** serverim.
- [x] Veikt  Docker uzdatēšanu, pēc  https://docs.docker.com/engine/install/ubuntu/ instrukcijas . Kuru metodi izmantot, izvēlamies paši.
- [x] Pārliecinieties, ka Docker darbojas, izmantojot docker -v un docker ps.
- [x] Izveidot dokumentāciju.
- [x] Papildināt wiki.
- [x] Papildināt repozitoriju.
- [x] Automatizēt uzstādīšanu izmantojot **Github Actions**. Lai vDocker** varetu tikt uzstādīts uz jebkura cita Jūsu **EC2** servera.

## _Petclinic_ uzstādīšana
6 p

- [x] EC2 serveri pārvietojies uz home directory un izveidot Dockerfile.
- [x] Faila izvietot zemāk esošo kodu kuru papildināt ar:
- Image ar jdk 19 uz alpine 3.16 bazes.
-  Petclinic versions 5.3.22**


  ```Dockerfile
  RUN apk update && \
      apk add tar \
              wget
  RUN wget -O petclinic.tar.gz "https://github.com/spring-petclinic/spring-framework-petclinic/archive/refs/tags/v${PETCLINIC_VERSION}.tar.gz" -q \
      && tar -xzf petclinic.tar.gz \
      && rm -f petclinic.tar.gz
  RUN apk del tar \
              wget

  EXPOSE 8080
  WORKDIR spring-framework-petclinic-${PETCLINIC_VERSION}
  ENTRYPOINT ["./mvnw", "jetty:run-war"]
  ```
- [x] Uzbūvēt Docker image – petclinic<gorup_name> ar tag 1.0.0;
- [x] Esošajā image registry novilkt spring-framework-petclinic no oficiala springcommunity hub.
- [x] Izmantojot tikko uzbūvēto image, un paņemto no repozitorija palaist Petclinic konteineru aplikāciju.
Sekot līdz aplikācijas uzstādīšanas var ar `docker log` komandu:
- [x] Piekļūsti abam aplikācijam izmantojot instances publisko IP adresi
- [x] Ievieto ekrānuzņēmumu ar Petclinic un IP wiki zem sadaļas DONE.
-	[x] Automatizēt uzstādīšanas procesu ar GitHub actions.

## _image_ kopešana
2 p

- [x] Pirms nosūtīšanas uz DockerHub, pārliecinieties, ka image ir pareizi marķēts un darbojas, izmantojot docker run.
- [x] https://hub.docker.com/ konta izveidot jaunu repozitoriju petclinic<gorup_name>
- [x] Savā EC2 instancē pārsaukt petclinic<gorup_name>:1.0.0 Docker image uz <groupname>/petclinic:5.3.22.
- [x] Nosutit Docker image uz publisko DockerHub
  ```sh
  sudo docker login -u <DockerHubLietotajvards>/
  sudo docker push <DockerHubLietotajvards>/petclinic:5.3.0
  ```
- [x] Ievieto ekrānuzņēmumu ar https://hub.docker.com/ wiki DONE lapa.


## _image_ kopēšanā S3
6 p*
- [x] Veikt image kopēšanu S3 bucket.


## _Petclinic_ uzstādīšana izmantojot pipelines
10 p*
- [x] Build Github runer puse. Pie izmaiņas kādā no koda branch.
- [x] Image push uz github vai S3repo pēc veiksmīgā build.
