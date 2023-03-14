open Message.QAndA
open Mui
open ReactIntl
open Common.Text

module Section = QAndA_Section

@react.component
let make = () => {
  let intl = useIntl()

  <Common.Text
    header
    afterHeader={<Typography variant=#h4>
      {intl->Intl.formatMessage(subHeader)->React.string}
    </Typography>}
    body=Element(
      list{
        <Section
          header=question1
          body=Fragments(list{
            list{{content: answer1Paragraph1}},
            list{{content: answer1Paragraph2Part1, bold: true}, {content: answer1Paragraph2Part2}},
            list{{content: answer1Paragraph3}},
          })
          key="question-1"
        />,
        <Section header=question2 body=Paragraphs(list{answer2Paragraph1}) key="question-2" />,
        <Section
          header=question3
          body=Paragraphs(list{answer3Paragraph1, answer3Paragraph2, answer3Paragraph3})
          key="question-3"
        />,
        <Section
          header=question4
          body=Paragraphs(list{answer4Paragraph1, answer4Paragraph2})
          key="question-4"
        />,
        <Section
          header=question5
          body=Paragraphs(list{
            answer5Paragraph1,
            answer5Paragraph2,
            answer5Paragraph3,
            answer5Paragraph4,
          })
          key="question-5"
        />,
        <Section
          header=question6
          body=Paragraphs(list{
            answer6Paragraph1,
            answer6Paragraph2,
            answer6Paragraph3,
            answer6Paragraph4,
            answer6Paragraph5,
            answer6Paragraph6,
            answer6Paragraph7,
          })
          key="question-6"
        />,
        <Section
          header=question7
          body=Fragments(list{
            list{
              {content: answer7Paragraph1Part1},
              {content: answer7Paragraph1Part2, bold: true},
              {content: answer7Paragraph1Part3},
            },
            list{{content: answer7Paragraph2Part1}, {content: answer7Paragraph2Part2, bold: true}},
            list{{content: answer7Paragraph3}},
          })
          key="question-7"
        />,
        <Section
          header=question8
          body=Paragraphs(list{answer8Paragraph1, answer8Paragraph2})
          key="question-8"
        />,
        <Section
          header=question9
          body=Paragraphs(list{answer9Paragraph1, answer9Paragraph2})
          key="question-9"
        />,
        <Section
          header=question10
          body=Paragraphs(list{
            answer10Paragraph1,
            answer10Paragraph2,
            answer10Paragraph3,
            answer10Paragraph4,
            answer10Paragraph5,
          })
          key="question-10"
        />,
        <Section
          header=question11
          body=Lists(list{
            {
              title: answer11Paragraph1,
              list: list{
                answer11Paragraph1No1,
                answer11Paragraph1No2,
                answer11Paragraph1No3,
                answer11Paragraph1No4,
              },
            },
            {
              title: answer11Paragraph2,
              list: list{answer11Paragraph2Yes1, answer11Paragraph2Yes2},
            },
          })
          key="question-11"
        />,
        <Section
          header=question12
          body=Fragments(list{
            list{
              {content: answer12Paragraph1Part1},
              {content: answer12Paragraph1Part2, bold: true},
            },
          })
          key="question-12"
        />,
        <Section
          header=question13
          body=Paragraphs(list{answer13Paragraph1, answer13Paragraph2})
          key="question-13"
        />,
      }
      ->Belt.List.toArray
      ->React.array,
    )
  />
}