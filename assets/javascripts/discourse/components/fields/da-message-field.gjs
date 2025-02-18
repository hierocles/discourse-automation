import BaseField from "./da-base-field";
import DAFieldLabel from "./da-field-label";
import DAFieldDescription from "./da-field-description";
import { TextArea } from "@ember/legacy-built-in-components";
import PlaceholdersList from "../placeholders-list";
import { action } from "@ember/object";

export default class MessageField extends BaseField {
  <template>
    <section class="field message-field">
      <div class="control-group">
        <DAFieldLabel @label={{@label}} @field={{@field}} />

        <div class="controls">
          <div class="field-wrapper">
            <TextArea
              @value={{@field.metadata.value}}
              @input={{this.updateValue}}
              @disabled={{@field.isDisabled}}
            />

            <DAFieldDescription @description={{@description}} />

            {{#if this.displayPlaceholders}}
              <PlaceholdersList
                @currentValue={{@field.metadata.value}}
                @placeholders={{@placeholder}}
                @onCopy={{this.test}}
              />
            {{/if}}
          </div>
        </div>
      </div>
    </section>
  </template>

  @action
  updateValue(event) {
    this.mutValue(event.target.value);
  }
}
