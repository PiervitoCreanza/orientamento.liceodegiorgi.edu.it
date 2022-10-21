# dato.config.rb

create_data_file("_data/incontri.json", :json, 

    sezione1: {
        titolo: "<span class='text-red'>Ci vuoi</span> incontrare?",
        sottotitolo: "Vista l'impossibilità di presentare il nostro Liceo con un classico <b>Open Day</b> (<a href=\"https://youtu.be/01k6tjEpeTk\">come abbiamo fatto gli scorsi anni</a>) abbiamo previsto diverse tipologie di incontri informativi."
    },

    listaIncontri: dato.tipi_di_incontris.map do |tipoIncontro|
        {
            titolo: tipoIncontro.titolo,
            sottotitolo: tipoIncontro.sottotitolo,
            date: dato.incontris.select {|incontro| incontro.tipo_di_incontro.titolo == tipoIncontro.titolo}.map do |incontro| 
                {
                    giorno: incontro.giorno,
                    mese: incontro.mese,
                    orario: "Dalle " + incontro.ora_inizio + " alle " + incontro.ora_fine,
                    url: incontro.url,
                    pulsante: incontro.testo_pulsante,
                    data: incontro.data
                }
            end
        }
        end
)