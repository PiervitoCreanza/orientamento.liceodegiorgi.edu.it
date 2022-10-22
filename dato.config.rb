# dato.config.rb

create_data_file("_data/incontri.json", :json, 

    sezione1: {
        titolo: "<span class='text-red'>Ci vuoi</span> incontrare?",
        sottotitolo: "Vista l'impossibilità di presentare il nostro Liceo con un classico <b>Open Day</b> (<a href=\"https://youtu.be/01k6tjEpeTk\">come abbiamo fatto gli scorsi anni</a>) abbiamo previsto diverse tipologie di incontri informativi."
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