import algoliasearch from 'algoliasearch/lite';
import instantsearch from 'instantsearch.js';
import { searchBox, hits } from 'instantsearch.js/es/widgets';

const searchClient = algoliasearch('N3OU7O8UZ5', '99230f21f7173211acbf65827c1c120e');

const search = instantsearch({
  indexName: 'Space',
  searchClient,
});

const initAlgolia = () => {
  search.addWidgets([
    searchBox({
      container: "#searchbox"
    }),
    hits({
      container: '#hits',
      hitsPerPage: 100,
      templates: {
        empty: `<div class="col-md-12" style="text-align: center;"> We didn't find any results for the search <em>\"{{query}}\"</em></div`,
        item: function(hit) {
          try {
            return `
            <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="card-trip">
            <img src="https://images.unsplash.com/photo-1513151233558-d860c5398176?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80">
            <div class="card-text">
            <div class="card-info">
            <h2> ${hit.name}</h2>
            <p> <%= User.find(${hit.owner_id}).first_name> </p>
            </div>
            <h3>📍${hit.address} </h3>
            </div>
            </div>
            </div>
            `;
          } catch (e) {
            console.warn("Couldn't render hit", hit, e);
            return "";
          }
        }
      }
    })
    ])
  search.start();
}

export { initAlgolia }
