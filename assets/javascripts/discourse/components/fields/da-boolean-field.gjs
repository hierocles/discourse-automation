import BaseField from "./da-base-field";
import { Input } from "@ember/component";
import DAFieldLabel from "./da-field-label";
import DAFieldDescription from "./da-field-description";
import { action } from "@ember/object";
import { on } from "@ember/modifier";

export default class BooleanField extends BaseField {
  <template>
    <section class="field boolean-field">
      <div class="control-group">
        <DAFieldLabel @label={{@label}} @field={{@field}} />

        <div class="controls">
          <Input
            @type="checkbox"
            @checked={{@field.metadata.value}}
            {{on "input" this.onInput}}
            disabled={{@field.isDisabled}}
          />

          <DAFieldDescription @description={{@description}} />
        </div>
      </div>
    </section>
  </template>

  @action
  onInput(event) {
    this.mutValue(event.target.checked);
  }
}
