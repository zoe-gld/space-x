import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initFlatpickr } from '../plugins/init_flatpickr';

initMapbox();
initAutocomplete();
initFlatpickr();


import algoliasearch from 'algoliasearch/lite';
import instantsearch from 'instantsearch.js';
import { searchBox, hits } from 'instantsearch.js/es/widgets';

const searchClient = algoliasearch('N3OU7O8UZ5', '99230f21f7173211acbf65827c1c120e');

const search = instantsearch({
  indexName: 'Space',
  searchClient,
});

search.addWidgets([
  searchBox({
    container: "#searchbox"
  }),

  hits({
    container: "#hits",
    templates: {
      item: `
        <p>
         {{#helpers.highlight}}{ "attribute": "name" }{{/helpers.highlight}}
        </p>
      `,
    },
  })
]);

// instantsearch.widgets.infiniteHits({
//   container: '#infinite-hits',
//   templates: {
//     item: `
//       <h2>
//         {{#helpers.highlight}}{ "attribute": "name" }{{/helpers.highlight}}
//       </h2>
//       <p>{{ description }}</p>
//     `,
//   },
// });

search.start();
