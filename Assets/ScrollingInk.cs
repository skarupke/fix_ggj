using UnityEngine;
using UnityEngine.UI;
using System;
using Ink.Runtime;
using System.Collections.Generic;

// This is a super bare bones example of how to play and display a ink story in Unity.
public class ScrollingInk : MonoBehaviour
{
    public static event Action<Story> OnCreateStory;

    void Awake()
    {
        // Remove the default message
        RemoveChildren();
        StartStory();
    }

    // Creates a new Story object with the compiled story which we can then play!
    void StartStory()
    {
        story = new Story(inkJSONAsset.text);
        if (OnCreateStory != null) OnCreateStory(story);
        RefreshView();
    }

    // This is the main function called every time the story changes. It does a few things:
    // Destroys all the old content and choices.
    // Continues over all the lines of text, then displays all the choices. If there are no choices, the story is finished!
    void RefreshView()
    {
        // Remove all the UI on screen
        RemoveChildren();

        // Read all the content until we can't continue any more
        while (story.canContinue)
        {
            // Continue gets the next line of the story
            string text = story.Continue();
            // This removes any white space from the text.
            text = text.Trim();
            // Display the text on screen!
            AppendText(text);
        }

        // Display all the choices, if there are any!
        if (story.currentChoices.Count > 0)
        {
            for (int i = 0; i < story.currentChoices.Count; i++)
            {
                Choice choice = story.currentChoices[i];
                Button button = CreateChoiceView(choice.text.Trim());
                // Tell the button what to do when we press it
                button.onClick.AddListener(delegate {
                    OnClickChoiceButton(choice);
                });
            }
        }
        // If we've read all the content and there's no choices, the story is finished!
        else
        {
            Button choice = CreateChoiceView("End of story.\nRestart?");
            choice.onClick.AddListener(delegate {
                StartStory();
            });
        }
        UIX.UpdateLayout(rootCanvas.transform);
        float height = scrollRect.content.rect.height;
        float num_to_show = 400.0f;
        if (num_to_show < height)
        {
            float down = height - num_to_show;
            scrollRect.verticalNormalizedPosition = 1.0f - (down / height);
        }
    }

    // When we click the choice button, tell the story to choose that choice!
    void OnClickChoiceButton(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        AppendLine();
        RefreshView();
    }

    void AppendLine()
    {
        textPrefab.text += "\n---------------\n";
    }

    void AppendText(string text)
    {
        textPrefab.text += '\n' + text;
    }

    // Creates a button showing the choice text
    Button CreateChoiceView(string text)
    {
        // Creates the button from a prefab
        Button choice = Instantiate(buttonPrefab) as Button;
        choice.transform.SetParent(canvas.transform, false);

        // Gets the text from the button prefab
        Text choiceText = choice.GetComponentInChildren<Text>();
        choiceText.text = text;

        // Make the button expand to fit the text
        /*VerticalLayoutGroup layoutGroup = canvas.GetComponent<VerticalLayoutGroup>();
        if (layoutGroup)
        {
            layoutGroup.childForceExpandHeight = false;
            layoutGroup.childForceExpandHeight = true;
        }*/

        added_buttons.Add(choice);

        return choice;
    }

    // Destroys all the children of this gameobject (all the UI)
    void RemoveChildren()
    {
        foreach(Button b in added_buttons)
        {
            GameObject.Destroy(b.gameObject);
        }
        added_buttons.Clear();
    }

    [SerializeField]
    private TextAsset inkJSONAsset;
    public Story story;

    [SerializeField]
    private GameObject canvas;
    [SerializeField]
    private GameObject rootCanvas;

    // UI Prefabs
    [SerializeField]
    private Text textPrefab;
    [SerializeField]
    private Button buttonPrefab;

    [SerializeField]
    private ScrollRect scrollRect;

    private List<Button> added_buttons = new List<Button>();
}

     
public static class UIX
{
    /// <summary>
    /// Forces the layout of a UI GameObject and all of it's children to update
    /// their positions and sizes.
    /// </summary>
    /// <param name="xform">
    /// The parent transform of the UI GameObject to update the layout of.
    /// </param>
    public static void UpdateLayout(Transform xform)
    {
        Canvas.ForceUpdateCanvases();
        UpdateLayout_Internal(xform);
    }

    private static void UpdateLayout_Internal(Transform xform)
    {
        if (xform == null || xform.Equals(null))
        {
            return;
        }

        // Update children first
        for (int x = 0; x < xform.childCount; ++x)
        {
            UpdateLayout_Internal(xform.GetChild(x));
        }

        // Update any components that might resize UI elements
        foreach (var layout in xform.GetComponents<LayoutGroup>())
        {
            layout.CalculateLayoutInputVertical();
            layout.CalculateLayoutInputHorizontal();
        }
        foreach (var fitter in xform.GetComponents<ContentSizeFitter>())
        {
            fitter.SetLayoutVertical();
            fitter.SetLayoutHorizontal();
        }
    }
}

