import { BiHomeAlt } from 'react-icons/bi'
import S from "@sanity/desk-tool/structure-builder";

const Structure =
  S.list()
    .title("Content")
    .items([
      S.listItem()
        .title("Home Page")
        .child(
          S.document()
            .title("Home Page")
            .id("homePage")
            .documentId("homePage")
            .schemaType("homePage"),
        )
        .icon(BiHomeAlt),
    ]);

export default Structure;
