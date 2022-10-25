# dato.config.rb

page_incontri = dato.page_incontri

create_data_file("_data/incontri.json", :json, 
    sezione1: {
    titolo: {
        rosso: page_incontri.titolo_rosso,
        nero: page_incontri.titolo_nero
    },
    sottotitolo: page_incontri.sottotitolo,
    },
    listaIncontri: dato.tipi_di_incontris.map do |tipoIncontro|
        {
            titolo: {
                titolo_rosso: tipoIncontro.titolo_rosso,
                titolo_nero: tipoIncontro.titolo_nero,
            },
            sottotitolo: {
                sottotitolo_nero: tipoIncontro.sottotitolo,
                sottotitolo_rosso: tipoIncontro.sottotitolo_rosso
            },
            date: dato.incontris.select {|incontro| incontro.tipo_di_incontro.titolo == tipoIncontro.titolo}.map do |incontro| 
                {
                    orario: "Dalle " + incontro.ora_inizio + " alle " + incontro.ora_fine,
                    url: incontro.url,
                    pulsante: incontro.testo_pulsante,
                    data: incontro.data
                }
            end
        }
        end
)

create_data_file("_data/domande.json", :json, 

    sezione1: {
        titolo: "<span class='text-red'>Hai una</span> domanda?",
        sottotitolo: "Le domande frequenti che possono aiutarti nella fase di scelta e di iscrizione.",
        pulsanteRosso: "Contattaci",
        pulsante: "Vai alle domande frequenti"
    },

    domande: dato.gruppi_di_domandes.map do |argomento|
        {
            argomento: argomento.nome,
            domande: dato.domandes.select {|domanda| domanda.argomento.nome == argomento.nome}.map do |domanda| 
                {
                    domanda: domanda.domanda,
                    risposta: domanda.risposta
                }
            end
        }
        end
)

contatti = dato.contatti
create_data_file("_data/contatti.json", :json,
    sezione1: {
        titolo_rosso: contatti.titolo_rosso,
        titolo_nero: contatti.titolo,
        sottotitolo: contatti.sottotitolo,
        pulsanteRosso: contatti.pulsante_rosso,
        pulsante: contatti.pulsante,
        corpo: contatti.corpo.map do |paragrafo|
            paragrafo.testo
        end
    }
)

home = dato.page_home
create_data_file("_data/home.json",:json,
  sezione1: {
    sottotitolo: home.sottotitolo,
    pulsanteRosso: home.pulsante_rosso,
    pulsante: home.pulsante
  },
  sezioni: home.sezioni.map do |sezione| {
    titoloRosso: sezione.titolo_rosso,
    titolo: sezione.titolo_nero,
    sottotitolo: sezione.sottotitolo,
    toggleBoxes: sezione.extra.select {| extra | extra.item_type.api_key == "toggle_box"}.map do |toggleBox| 
        {
        titolo: toggleBox.titolo,
        descrizione: toggleBox.descrizione,
        testoPulsante: toggleBox.testo_pulsante
      }
    end,
    paragrafi: sezione.extra.select {| extra | extra.item_type.api_key == "paragrafo"}.map do |paragrafo| {
        titolo: paragrafo.titolo,
        sottotitolo: paragrafo.testo
    }
    end
}
end
)
